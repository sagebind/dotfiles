function init --on-event init_apt
    complete -c apt -a 'autoremove check clean configure install in policy ppa purge remove rm search show update up upgrade'
end


function apt -d "Short and friendly command wrapper for apt-get"
    if test (count $argv) -lt 1
        echo "No command specified."
        return 1
    end

    switch $argv[1]
        case autoremove
            sudo apt-get autoremove
        case check
            sudo apt-get check
        case clean
            sudo apt-get autoclean
        case configure
            sudo dpkg-reconfigure $argv[2..-1]
        case install in
            sudo apt-get install $argv[2..-1]
        case policy
            env LANG=C apt-cache policy
        case ppa
            if test (count $argv) -ge 2
                switch $argv[2]
                case list
                    for APT in (find /etc/apt/ -name \*.list)
                        grep -o "^deb http://ppa.launchpad.net/[a-z0-9\-]\+/[a-z0-9\-]\+" $APT | while read ENTRY
                            set USER (echo $ENTRY | cut -d/ -f4)
                            set PPA (echo $ENTRY | cut -d/ -f5)
                            echo $USER/$PPA
                        end
                    end
                case remove
                    sudo add-apt-repository --remove ppa:$argv[3]
                case purge
                    sudo ppa-purge ppa:$argv[3]
                case '*'
                    sudo add-apt-repository ppa:$argv[2]
                end
            else
                echo "No PPA specified."
            end
        case purge
            sudo apt-get --purge remove $argv[2..-1]
        case remove rm
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
