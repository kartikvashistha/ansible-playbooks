#!/bin/bash
# Simple bash script that bootstraps a fresh system with ansible and other necessary dependencies to run the many playbooks in this repo.
# Currently only supports bootstrapping Fedora and macOS machines, but can be extended quite easily for other linux distributions.

set -e

is_macos() {
  echo "Detected a macOS system!"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew install ansible
  ansible-galaxy collection install community.general
}

is_fedora() {
  sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
  sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
  sudo sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=\"https://downloads.1password.com/linux/keys/1password.asc\"" > /etc/yum.repos.d/1password.repo'
  sudo dnf install 1password 1password-cli ansible ansible-core curl git zsh ffmpeg -y --allowerasing
  ansible-galaxy collection install community.general
}

is_linux() {
  release="$(cat /etc/os-release)"

  if [[ $release =~ "Fedora Linux" ]]; then
    echo "Detected a Fedora system!"
    is_fedora
  else
    echo "Unsupported Linux distribution!"
  fi
}

case "$OSTYPE" in
darwin*) is_macos ;;
linux-gnu) is_linux ;;
*) echo "unsupported OSTYPE: $OSTYPE" ;;
esac
