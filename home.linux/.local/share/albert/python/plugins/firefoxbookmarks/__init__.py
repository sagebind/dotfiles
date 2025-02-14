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
        self.fbh = FBH(self)
        self.registerExtension(self.fbh)

        self._include_toolbar = self.readConfig("include_toolbar", bool) or True
        self._include_menu = self.readConfig("include_menu", bool) or False
        self._include_unfiled = self.readConfig("include_unfiled", bool) or False

        self.firefox_root = Path.home() / ".mozilla" / "firefox"
        self.resolved_places_path = str(self._get_places_path())

    def __del__(self):
        self.deregisterExtension(self.fbh)

    @property
    def include_toolbar(self):
        return self._include_toolbar

    @include_toolbar.setter
    def include_toolbar(self, value):
        self._include_toolbar = value
        self.writeConfig("include_toolbar", value)

    @property
    def include_menu(self):
        return self._include_menu

    @include_menu.setter
    def include_menu(self, value):
        self._include_menu = value
        self.writeConfig("include_menu", value)

    @property
    def include_unfiled(self):
        return self._include_unfiled

    @include_unfiled.setter
    def include_unfiled(self, value):
        self._include_unfiled = value
        self.writeConfig("include_unfiled", value)

    def configWidget(self):
        return [
            {
                'type': 'checkbox',
                'property': 'include_toolbar',
                'label': 'Include bookmarks in "Bookmarks Toolbar" in results.',
            },
            {
                'type': 'checkbox',
                'property': 'include_menu',
                'label': 'Include bookmarks in "Bookmarks Menu" in results.',
            },
            {
                'type': 'checkbox',
                'property': 'include_unfiled',
                'label': 'Include bookmarks in "Other Bookmarks" in results.',
            },
        ]

    def handleTriggerQuery(self, query):
        for item in self._query(query.string, 5):
            query.add(item)

    def _query(self, term, limit):
        places = Places(self.resolved_places_path)
        try:
            for title, url, iconUrl in places.query(term, self._get_root_folders(), limit):
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

    def _get_root_folders(self):
        folders = []
        if self.include_toolbar:
            folders.append("toolbar")
        if self.include_menu:
            folders.append("menu")
        if self.include_unfiled:
            folders.append("unfiled")
        return folders

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

    def query(self, term, parent_folders, limit):
        c = self.conn.cursor()

        params = [f"%{term}%"]
        params.extend(parent_folders)
        params.append(limit)

        # This crazy query recursively traverses the bookmark tree to filter
        # bookmarks by their root folder, then sorting the results by "frecency".
        query = f"""
            WITH RECURSIVE bookmarks_tree(bookmark_id, root_id) AS (
                SELECT id AS bookmark_id, id AS root_id
                FROM moz_bookmarks
                WHERE parent = 1
                UNION ALL
                SELECT b.id AS bookmark_id, tree.root_id
                FROM moz_bookmarks b
                JOIN bookmarks_tree tree ON b.parent = tree.bookmark_id
            )
            SELECT bookmark.title, place.url, place.preview_image_url
            FROM bookmarks_tree tree
            JOIN moz_bookmarks bookmark ON bookmark.id = tree.bookmark_id
            JOIN moz_bookmarks root ON root.id = tree.root_id
            JOIN moz_places place ON place.id = bookmark.fk
            WHERE tree.bookmark_id != tree.root_id
                AND bookmark.title LIKE ?
                AND root.title IN ({','.join('?' * len(parent_folders))})
            ORDER BY place.frecency DESC
            LIMIT ?
        """

        c.execute(query, params)
        return c.fetchall()

    def close(self):
        self.conn.close()
