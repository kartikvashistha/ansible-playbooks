# Neovim 

Simple role to install my neovim config files across my various dev machines. It was originally part of the dotfiles role, but since this is the only part of the config that updates the most often, it made sense to extract it out of the dotfiles role into its own role. 

Being on it's own role also allows it to be portable, such that other internet folks can install/trial my neovim config on their system and better decide which parts of the config they like. To install this/my neovim config, please run the `playbook-nvim-dots.yml` at the root of this repo (note, please backup your exisiting neovim config, if any as this will overwrite your current neovim config). 
