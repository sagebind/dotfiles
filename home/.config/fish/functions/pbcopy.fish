function pbcopy -d "Redirects input to the system clipboard"
    if type -fq pbcopy
        command pbcopy
    else if type -fq clip.exe
        command clip.exe
    else if type -fq xsel
        command xsel --clipboard --input
    end
end
