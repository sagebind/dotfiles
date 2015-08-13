function fix-chrome-shortcut
    sudo sed -i -- 's/usr\/bin\/google-chrome-stable/opt\/google\/chrome\/google-chrome/g' /usr/share/applications/google-chrome.desktop
end
