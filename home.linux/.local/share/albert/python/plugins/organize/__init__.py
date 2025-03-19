from os import scandir
from pathlib import Path
from subprocess import run, CalledProcessError
from albert import *


md_iid = "3.0"
md_version = "1.0"
md_name = "Organize"
md_description = "Quickly launch Organize"
md_bin_dependencies = ["organize"]


class Plugin(PluginInstance, IndexQueryHandler):
    def __init__(self):
        PluginInstance.__init__(self)
        IndexQueryHandler.__init__(self)

    def defaultTrigger(self):
        return "organize "

    def updateIndexItems(self):
        self.setIndexItems([
            IndexItem(
                string="sim",
                item=StandardItem(
                    id="sim",
                    text="sim",
                    subtext="Simulate organizing your files.",
                    actions=[Action(id="start", text="start", callable=self.sim)]
                )
            ),
            IndexItem(
                string="run",
                item=StandardItem(
                    id="run",
                    text="run",
                    subtext="Organize your files.",
                    actions=[Action(id="start", text="start", callable=self.run)]
                )
            ),
        ])

    def sim(self):
        runDetachedProcess(["ghostty", "-e", "organize sim; read -p 'Press enter to close.'"])

    def run(self):
        runDetachedProcess(["ghostty", "-e", "organize run; read -p 'Press enter to close.'"])
