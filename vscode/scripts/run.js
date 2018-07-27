exports.command = {
    id: "sagebind.run",
    displayName: "Run command"
};

exports.execute = function (args) {
    var vscode = require('vscode');

    vscode.window.showInputBox({
        prompt: "Enter command to run",
        placeHolder: "command..."
    }).then(function (command) {
        var terminal = vscode.window.createTerminal();
        terminal.show(true);
        terminal.sendText(command, true);
    });
};
