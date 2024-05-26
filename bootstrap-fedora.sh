#/bin/bash
set -e
# Bootstrap script that installs the initial ansible dependencies, few base packages, the Oh My ZSH framework and runs the playbook.yml in this repo.

sudo dnf install ansible ansible-core curl git zsh -y

ansible-galaxy collection install community.general

