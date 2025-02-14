from os import scandir
from pathlib import Path
from subprocess import run, CalledProcessError
from albert import *


md_iid = "2.3"
md_version = "1.0"
md_name = "Visual Studio Code"
md_description = "Quickly launch Visual Studio Code projects"
md_bin_dependencies = ["code"]


class Plugin(PluginInstance, TriggerQueryHandler):
    def __init__(self):
        PluginInstance.__init__(self)
        TriggerQueryHandler.__init__(
            self, self.id, self.name, self.description,
            defaultTrigger='vsc '
        )
        self._root_dir = self.readConfig("root_dir", str) or ""

    @property
    def root_dir(self):
        return self._root_dir

    @root_dir.setter
    def root_dir(self, value):
        self._root_dir = value
        self.writeConfig("root_dir", value)

    def configWidget(self):
        return [
            {
                'type': 'lineedit',
                'property': 'root_dir',
                'label': 'Root directory for projects'
            }
        ]

    def handleTriggerQuery(self, query):
        if not self.root_dir:
            return

        with scandir(self.root_dir) as dirs:
            for entry in dirs:
                if not entry.name.startswith('.') and entry.is_dir() and query.string in entry.name:
                    query.add(
                        StandardItem(
                            id=entry.path,
                            text=entry.name,
                            subtext=entry.path,
                            actions=[
                                Action(
                                    id="open",
                                    text="Open in Visual Studio Code",
                                    callable=lambda path=entry.path: self._launch(path)
                                )
                            ]
                        )
                    )

    def _launch(self, path):
        runDetachedProcess(["code", path])
