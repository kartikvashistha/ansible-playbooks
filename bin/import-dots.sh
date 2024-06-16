# Simple bash script that copies my local nvim config into this repo.

#/bin/bash
set -e
cp -r ~/.config/nvim/{init.lua,lua/} ~/code/ansible-playbooks/roles/neovim/files/nvim/

