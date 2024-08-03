# ansible-playbooks
Repo that stores all of my Ansible playbooks, roles, group_vars and inventories.

## Pre-requisites
To bootstrap your Fedora or macOS machines with Ansible and dependencies, you can run the `./bin/boostrap.sh` script. 

**Note: for macOS, the homebrew package manager is used to install ansible.**

For other distributions, please feel free to install Ansible via your package manager. See [this](https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html) for more info.

## How to run a playbook

```
ansible-playbook -K <playbook-name>
```

Example:
```
# Run the Fedora Workstation setup playbook
ansible-playbook -K playbook-setup-fedora-ws.yml

# To discover all system data that is available to Ansible for use, run the print-ansible-facts.yml playbook
ansible-playbook -K print-ansible-facts.yml
```
