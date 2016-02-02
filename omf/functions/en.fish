function en -d "Command for accessing Evernote using Geeknote"
    if test (count $argv) -lt 1
        echo "No command specified."
        return 1
    end
    switch $argv[1]
        case create
            geeknote $argv
            geeknote find
            geeknote edit 1
        case find
            set -l search
            set -l tags
            set -l notebook
            set -l count 20

            for arg in $argv[2..-1]
                if test (echo $arg | cut -c 1-4) = "tag:"
                    set tags $tags (echo $arg | cut -c 5-)
                else if test (echo $arg | cut -c 1-9) = "notebook:"
                    set notebook (echo $arg | cut -c 10-)
                else if test (echo $arg | cut -c 1-6) = "count:"
                    set count (echo $arg | cut -c 7-)
                else
                    set search $search $arg
                end
            end

            set -l params find --content-search --count $count

            if test -n "$notebook"
                set params $params --notebooks "$notebook"
            end

            if test -n "$tags"
                set params $params --tags (echo -s ,$tags | cut -b 2-)
            end

            if test -n "$search"
                set params $params --search "$search"
            end

            geeknote $params
        case list
            geeknote --help
        case manual
            geeknote show geeknote
        case show
            geeknote show $argv[2..-1] | markdown2 | lynx -stdin -nomargins -nomore -notitle
        case '*'
            geeknote $argv[1..-1]
    end
end
