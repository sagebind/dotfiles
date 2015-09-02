function init --on-event init_composer
    # add Composer's global binaries to PATH
    if test -z "$COMPOSER_BIN_PATH"
        set -gx COMPOSER_BIN_PATH $HOME/.composer/vendor/bin
    end
    set PATH $COMPOSER_BIN_PATH $PATH

    # get composer path
    if test -z "$COMPOSER_BIN"
        if type "composer.phar" > /dev/null
            set -gx COMPOSER_BIN (which composer.phar)
        else if type "composer" > /dev/null
            set -gx COMPOSER_BIN (which composer)
        else
            echo "FAILED to find Composer! Please install composer.phar to your PATH."
        end
    end
end

function composer
    if test -e ./composer.phar # if there is composer in this path use local one
        ./composer.phar $argv;
    else if test -n "$COMPOSER_BIN"
        eval "$COMPOSER_BIN" $argv;
    else
        echo "Please install composer.phar to your PATH. Or use \"composer_install\" to install Composer to current directory."
    end
end
