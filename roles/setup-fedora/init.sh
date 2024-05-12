#/bin/bash
set -e
# Bootstrap script that installs the initial ansible dependencies, few base packages, the Oh My ZSH framework and runs the playbook.yml in this repo.

sudo dnf install ansible ansible-core curl git zsh -y

ansible-galaxy collection install community.general

chsh -s $(which zsh) # this will require reboot for the shell changes to take place

# Run the omz framework setup script
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ansible-playbook --ask-become-pass  playbook.yml
