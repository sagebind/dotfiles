function pbpaste -d "Writes the contents of the system clipboard to output"
    if type -fq pbpaste
        command pbpaste
    else if type -fq powershell.exe
        command powershell.exe -command "Get-Clipboard" | head -c-1
    else if type -fq xsel
        command xsel --clipboard --output
    end
end
