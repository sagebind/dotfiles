function apt --description "Short and friendly command wrapper for apt-get"
    if test (count $argv) -lt 1
        echo "No command specified."
        return 1
    end
    switch $argv[1]
        case clean
            sudo apt-get autoclean
        case install in
            sudo apt-get install $argv[2..-1]
        case policy
            env LANG=C apt-cache policy
        case purge
            sudo apt-get --purge remove $argv[2..-1]
        case remove re
            sudo apt-get remove $argv[2..-1]
        case search
            apt-cache search $argv[2..-1]
        case show
            apt-cache show $argv[2..-1]
        case update
            sudo apt-get update
        case upgrade
            if test $argv[2] = dist
                sudo apt-get dist-upgrade
            else
                sudo apt-get upgrade
            end
        case '*'
            apt-cache show $argv
    end
end

complete -c apt -a 'clean install in policy purge remove re search show update upgrade'
