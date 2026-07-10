tap "acsandmann/tap"
tap "SoloAntonio/cartero"
tap "supersonic-app/supersonic"

brew "btop"
brew "colima"
brew "coreutils"
brew "docker-buildx"
brew "docker-compose"
brew "docker"
brew "exiftool"
brew "fish"
brew "gifsicle"
brew "gnu-sed"
brew "gnu-tar"
brew "kubernetes-cli"
brew "media-info"
brew "parallel"
brew "rename"
brew "watch"
brew "zenity"

cask "block-goose"
cask "cartero"
cask "font-hurmit-nerd-font"
cask "font-symbols-only-nerd-font"
cask "jordanbaird-ice"
cask "kitty"
cask "localsend"
cask "middleclick"
cask "supersonic"
cask "swiftbar"

if `hostname`.strip == "MacBook-Pro-StephenCoakley"
  tap "buildkite/buildkite"
  tap "hashicorp/tap"
  tap "ngrok/ngrok"
  tap "pulumi/tap"
  tap "widen/brew", "git@github.com:Widen/brew"

  brew "aws-vault"
  brew "bash" # Get a newer Bash version needed for running some scripts
  brew "groovy"
  brew "jpeg-xl"
  brew "node"
  brew "qpdf"
  brew "webp"
  brew "yarn"
  brew "buildkite/buildkite/bk@3", trusted: true
  brew "hashicorp/tap/nomad", trusted: true
  brew "hashicorp/tap/packer", trusted: true
  brew "pulumi/tap/pulumi", trusted: true
  brew "widen/brew/local-nginx", trusted: true
  brew "widen/brew/slipway", trusted: true

  cask "1password-cli"
  cask "ngrok"
end
