function apt -d "Short and friendly command wrapper for apt-get"
    if test (count $argv) -lt 1
        echo "No command specified."
        return 1
    end
    switch $argv[1]
        case autoremove
            sudo apt-get autoremove
        case clean
            sudo apt-get autoclean
        case install in
            sudo apt-get install $argv[2..-1]
        case policy
            env LANG=C apt-cache policy
        case ppa
            if set -q argv[2]
                if test $argv[2] = remove
                    sudo add-apt-repository --remove ppa:$argv[3]
                else if test $argv[2] = purge
                    sudo ppa-purge ppa:$argv[3]
                else
                    sudo add-apt-repository ppa:$argv[2]
                end
            else
                echo "No PPA specified."
            end
        case purge
            sudo apt-get --purge remove $argv[2..-1]
        case remove re
            sudo apt-get remove $argv[2..-1]
        case search
            apt-cache search $argv[2..-1]
        case show
            apt-cache show $argv[2..-1]
        case update up
            sudo apt-get update
        case upgrade
            if test (count $argv) -ge 2; and test $argv[2] = dist
                sudo apt-get dist-upgrade
            else
                sudo apt-get upgrade
            end
        case '*'
            apt-cache show $argv
    end
end

complete -c apt -a 'autoremove clean install in policy ppa purge remove re search show update up upgrade'
