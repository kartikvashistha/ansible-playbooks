# ansible-playbooks
Repo that stores all of my Ansible playbooks, roles, vars and inventories.

## Pre-requisites
To bootstrap a Fedora or macOS machine with Ansible and dependencies,the `./bin/boostrap.sh` script can be executed.

> [!NOTE]
> For macOS, Ansible is installed via the homebrew package manager.

For other distributions, please feel free to install Ansible via your package manager. Refer to [this](https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html) for more info.

## How to run a playbook

```sh
ansible-playbook -K <playbook-name>
```

Example:
```sh
# To discover all system data that is available to Ansible for use, run the print-ansible-facts.yml playbook
ansible-playbook -K print-ansible-facts.yml

# Run the dotfiles playbook to install locally.
ansible-playbook playbooks/install-dotfiles.yml

# Depending on the playbook, host can be overriden via the `host_group` var (list of hosts can be found in the inventory `hosts.yml` file)
ansible-playbook playbooks/install-dotfiles.yml -e "host_group=vanaheim"
```

## List of Roles
Here is a list of my personally written and maintained Ansible roles that I use to setup and configure my various machines. 

1. `asdf` - To install and configure asdf on my local machines;
2. `dotfiles` - To install my dotfiles linux and macOS machines;
3. `fedora` - To configure and setup my various Fedora machines;
4. `kubernetes` - To configure and setup all of my kubernetes hosts with common settings;
5. `macos` - To configure and setup my macOS machines;
6. `neovim` - To install my nvim config (and optionally other neovim distros) on my linux and macOS machines;

