# Inspired by the idea of Topgrade, but I did not want an unnecessary program
# when a simple shell script will do.

function upgrade -d "Install system package updates"
  if type -fq flox
    echo "Upgrading Flox packages..."
    flox upgrade
  end

  if type -fq brew
    echo "Upgrading Homebrew packages..."
    brew update
    brew upgrade
  end

  if type -fq nobara-sync
    echo "Upgrading Nobara packages..."
    nobara-sync cli
  end
end
