from os import scandir
from pathlib import Path
from subprocess import run, CalledProcessError
from albert import *
import sqlite3


md_iid = "2.3"
md_version = "1.0"
md_name = "Firefox Bookmarks"
md_description = "Show Firefox bookmarks"
md_bin_dependencies = []


class Plugin(PluginInstance, TriggerQueryHandler):
    def __init__(self):
        PluginInstance.__init__(self)
        TriggerQueryHandler.__init__(
            self, self.id, self.name, self.description,
            defaultTrigger='bm '
        )
        # GlobalQueryHandler.__init__(self, self.id, self.name, self.description, defaultTrigger='st ')
        self.fbh = FBH(self)
        self.registerExtension(self.fbh)

        self.firefox_root = Path.home() / ".mozilla" / "firefox"
        self.resolved_places_path = str(self._get_places_path())

    def __del__(self):
        self.deregisterExtension(self.fbh)

    def handleTriggerQuery(self, query):
        for item in self._query(query.string, 5):
            query.add(item)

    def _query(self, term, limit):
        places = Places(self.resolved_places_path)
        try:
            for title, url, iconUrl in places.query(term, limit):
                yield StandardItem(
                    id=url,
                    text=title,
                    subtext=url,
                    iconUrls=[iconUrl] if iconUrl is not None else [],
                    actions=[
                        Action(
                            id="open",
                            text="Open bookmark in Firefox",
                            callable=lambda u=url: openUrl(u)
                        )
                    ]
                )
        finally:
            places.close()

    def _get_places_path(self):
        profile_id = self._get_default_profile_id()
        return self.firefox_root / profile_id / "places.sqlite"

    def _get_default_profile_id(self):
        with (self.firefox_root / "installs.ini").open() as file:
            for line in file:
                if line.startswith("Default="):
                    return line.split("=")[1].strip()


class FBH(FallbackHandler):
    def __init__(self, p: Plugin):
        super().__init__(id=p.id + 'fb', name=p.name, description=p.description)
        self.plugin = p

    def fallbacks(self, term :str):
        return [item for item in self.plugin._query(term, 3)]


class Places:
    def __init__(self, path):
        self.conn = sqlite3.connect(f"file:{path}?immutable=1", uri=True)
        # self.conn = sqlite3.connect(path)

    def query(self, term, limit):
        c = self.conn.cursor()
        c.execute(
            """
                SELECT bookmark.title, place.url, place.preview_image_url
                FROM moz_bookmarks bookmark
                JOIN moz_places place ON place.id = bookmark.fk
                JOIN moz_bookmarks parent1 ON parent1.id = bookmark.parent
                JOIN moz_bookmarks parent2 ON parent2.id = parent1.parent
                LEFT JOIN moz_bookmarks parent3 ON parent3.id = parent2.parent
                WHERE
                    bookmark.title LIKE ?
                    AND (
                        (parent1.title = "toolbar" AND parent2.parent = 0)
                        OR (parent2.title = "toolbar" AND parent3.parent = 0)
                    )
                ORDER BY place.frecency DESC
                LIMIT ?
            """,
            (f"%{term}%", limit)
        )
        return c.fetchall()

    def close(self):
        self.conn.close()
