# ansible-playbooks
Repo that stores all of my Ansible playbooks, roles, vars and inventories.

## Pre-requisites
To bootstrap your Fedora or macOS machines with Ansible and dependencies, you can run the `./bin/boostrap.sh` script.

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
ansible-playbook playbooks/install-dotfiles.yml -e "host_group=snowpiercer"
```
