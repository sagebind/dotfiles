# Wrapper for invoking keepassxc-cli if it is installed via flatpak

if not type -fq keepassxc-cli; and type -fq flatpak; and flatpak list | grep -q org.keepassxc.KeePassXC
  function keepassxc-cli
    command flatpak run --command=keepassxc-cli org.keepassxc.KeePassXC $argv
  end
end
