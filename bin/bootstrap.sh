# Simple bash script that bootstraps a fresh system with ansible and other necessary dependencies to run the many playbooks in this repo. Currently only supports bootstrapping Fedora and macOS machines, but can be extended quite easily for other linux distributions.

#/bin/bash
set -e

is_macos(){
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew install ansible
  ansible-galaxy collection install community.general
}

is_fedora(){
  sudo dnf install ansible ansible-core curl git zsh -y
  ansible-galaxy collection install community.general
}

is_linux() {
  release="$(cat /etc/os-release)"

  if [[ $release =~ "Fedora Linux"  ]]; then
    echo "Detected Fedora!" 
    is_fedora
  else
    "Unsupported Linux distribution :( "
  fi
}

if [[ -f /etc/os-release ]]; then
  case "$OSTYPE" in 
    darwin*) is_macos ;;
    linux-gnu) is_linux ;;
    *) echo "unsupported OSTYPE: $OSTYPE" ;;
  esac
fi
