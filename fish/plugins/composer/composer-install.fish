function composer-install
    set COMPOSER_BIN /usr/local/bin/composer
    curl -sS https://getcomposer.org/installer | php

    if test -e $COMPOSER_BIN
        sudo rm -f $COMPOSER_BIN
    end

    sudo mv composer.phar $COMPOSER_BIN
    sudo chmod +x $COMPOSER_BIN
end
