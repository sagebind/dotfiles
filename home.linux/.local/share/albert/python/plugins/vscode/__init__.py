from os import scandir
from pathlib import Path
from subprocess import Popen, PIPE
from albert import *


md_iid = "3.0"
md_version = "1.0"
md_name = "Visual Studio Code"
md_description = "Quickly launch Visual Studio Code projects"
md_bin_dependencies = ["code", "locate"]


class Plugin(PluginInstance, IndexQueryHandler):
    def __init__(self):
        PluginInstance.__init__(self)
        IndexQueryHandler.__init__(self)
        self._root_dir = self.readConfig("root_dir", str) or ""

    def defaultTrigger(self):
        return "code "

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

    def updateIndexItems(self):
        self.setIndexItems(list(self._generateIndexItems()))

    def _generateIndexItems(self):
        if not self.root_dir:
            return

        with Popen(["locate", f"{self.root_dir}/*/.git"], stdout=PIPE, text=True) as proc:
            for line in proc.stdout:
                path = Path(line.strip()).parent
                yield IndexItem(
                    string=str(path),
                    item=StandardItem(
                        id=str(path),
                        text=path.name,
                        subtext=str(path),
                        actions=[
                            Action(
                                id="open",
                                text="Open in Visual Studio Code",
                                callable=lambda path=str(path): self._launch(path)
                            )
                        ]
                    )
                )

    def _launch(self, path):
        runDetachedProcess(["code", path])
