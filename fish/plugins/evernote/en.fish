function en -d "Command for accessing Evernote using Geeknote"
    if test (count $argv) -lt 1
        echo "No command specified."
        return 1
    end
    switch $argv[1]
        case list
            geeknote --help
        case show
            geeknote show $argv[2..-1] | markdown2 | lynx -stdin -nomargins -nomore -notitle
        case '*'
            geeknote $argv[1..-1]
    end
end
