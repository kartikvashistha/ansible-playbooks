# Neovim

Simple role that installs my neovim config files across my various dev machines. It was originally part of the dotfiles role, but eventually separated to make it more portable and to allow other folks on the internet to install & trial my neovim configuration to better decide which parts of the config they like.

Additionally, this role also provides the ability to install and access multiple other neovim distros alongside my configuration via `NVIM_APPNAME`. See the `neovim_nvim_distros_list` variable under `defaults/main.yml`

## How to run the role

> [!CAUTION]
> Please backup your exisiting neovim config before running the `install-nvim-config.yml` as depending on the options passed, this might overwrite your existing neovim config.

> [!NOTE]
> You might also have to comment out the line `vault_password_file=./bin/vault_passwd_file.sh` in the `ansible.cfg` file at the root of this option when running the `install-nvim-config.yml` playbook from within this repo.

To install and trial my neovim config, the `install-nvim-config.yml` playbook can be run as follows:

```sh
# This installs my config under ~/.config/nvim by default
ansible-playbook playbooks/install-nvim-config.yml

# To install & trial my neovim config without replacing yours:
mkdir -p ~/.config/kartiks-nvim-config
ansible-playbook playbooks/install-nvim-config.yml -e "neovim_install_location=$HOME/.config/kartiks-nvim-config"
NVIM_APPNAME=kartiks-nvim-config nvim
```

## Role variables

| Variable | Type | Default value | Description|
|----------|------|-------|------------|
|neovim_home_user_path| string |`"{{ ansible_facts['env']['HOME'] }}"`| Home path of the user for which neovim will be installed |
|neovim_install_location| string |`{{ neovim_home_user_path }}/.config/nvim`| Lcoation where the nvim config will be installed |
|neovim_install_nvim_distros| boolean | false | Boolean flag to install multiple neovim distros. Should be set to `true` for the below options to work |
|neovim_shell_file_path| string |`{{ neovim_home_user_path }}/.zshrc`| Full path of the shell rc file where the nvim switch function will reside. Currently tested to work on zshrc only |
|neovim_nvim_distros_list| list(map(string)) | `[Astro, Lazy, NvChad, kickstart]` | List of neovim distros you want to install and access via $NVIM_APPNAME. Refer to the variable declaration to see how the structure should actually look like |
