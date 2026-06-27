# Inspired by the idea of Topgrade, but I did not want an unnecessary program
# when a simple shell script will do.

function upgrade -d "Install system package updates"
  if type -fq mise
    echo "Upgrading Mise packages..."
    mise upgrade
  end

  if type -fq flox
    echo "Upgrading Flox packages..."
    flox upgrade
  end

  if type -fq brew
    echo "Upgrading Homebrew packages..."
    brew update
    brew upgrade
  end

  if type -fq flatpak
    echo "Upgrading Flatpak packages..."
    flatpak update -y
  end

  if type -fq nobara-sync
    echo "Upgrading Nobara packages..."
    nobara-sync cli
  end
end
