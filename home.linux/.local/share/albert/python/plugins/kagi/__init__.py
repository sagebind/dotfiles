from albert import *
from pathlib import Path
from time import sleep
from urllib.request import urlopen
from urllib.parse import urlencode
import json


md_iid = "3.0"
md_version = "1.0"
md_name = "Kagi"
md_description = "Kagi search and suggest in Albert"
md_bin_dependencies = []


class Plugin(PluginInstance, TriggerQueryHandler):
    def __init__(self):
        PluginInstance.__init__(self)
        TriggerQueryHandler.__init__(self)
        self.fbh = FBH(self)
        self.iconUrls = [f"file:{Path(__file__).parent}/kagi.svg"]

    def extensions(self):
        return [self, self.fbh]

    def defaultTrigger(self):
        return "k "

    def handleTriggerQuery(self, query):
        if not query.string or not query.string.strip():
            return

        # naive throttling
        for _ in range(25):
            sleep(0.01)
            if not query.isValid:
                return

        for item in self._query(query.string):
            query.add(item)

    def _query(self, search_term :str):
        if not search_term or not search_term.strip():
            return

        suggested_terms = self._kagi_suggest(search_term)

        if not search_term in suggested_terms:
            suggested_terms.insert(0, search_term)

        for term in suggested_terms:
            yield StandardItem(
                id=term,
                text=term,
                subtext=F"Search Kagi for '{term}'",
                iconUrls=self.iconUrls,
                actions=[
                    Action(
                        id="search",
                        text="Search in web browser",
                        callable=lambda t=term: openUrl(f"https://kagi.com/search?{urlencode({"q": t})}"),
                    ),
                    Action(
                        id="feeling-lucky",
                        text=f"Open first result for '{term}'",
                        callable=lambda t=f"! {term}": openUrl(f"https://kagi.com/search?{urlencode({"q": t})}"),
                    )
                ]
            )

    def _kagi_suggest(self, query :str):
        params = urlencode({"q": query})
        with urlopen(f"https://kagi.com/api/autosuggest?{params}") as response:
            return json.load(response)[1]


class FBH(FallbackHandler):
    def __init__(self, p: Plugin):
        super().__init__()
        self.plugin = p

    def id(self):
        return self.plugin.id() + 'fb'

    def name(self):
        return self.plugin.name()

    def description(self):
        return self.plugin.description()

    def fallbacks(self, term :str):
        return [item for item in self.plugin._query(term)]

