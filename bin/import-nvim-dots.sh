# Simple bash script that copies my local nvim config into this repo.

#/bin/bash
set -e
export NVIM_FILES_PATH="$HOME/code/github.com/personal/ansible-playbooks/roles/neovim/files/nvim"
rm -r $NVIM_FILES_PATH/*
cp -r ~/.config/nvim/* $NVIM_FILES_PATH
rm $NVIM_FILES_PATH/lazy-lock.json
