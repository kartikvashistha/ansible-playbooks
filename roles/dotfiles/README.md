Dotfiles
=========

Ansible role to install my dotfiles across my different OS's.

Requirements
------------
Install Ansible per your OS:

```
# For macos
brew install ansible

# For fedora
sudo dnf install ansible ansible-core

# Install the community general collection
ansible-galaxy collection install community.general
```

Role Variables
--------------
The following variables are supported by this role:

| Variable  | Values   | Description |
| ------------- | ------------- |-----|
| os | (*required*) `macos`, `fedora`| The OS on which this role will run.|
| gitconfig_name | (*optional*) string| Value for gitconfig name.|
| gitconfig_email |(*optional*) string|Value for gitconfig email.|
| wsl| (**Default**: false) string |  Boolean value for WSL specific configurations.|

Example Playbook
----------------

Example playbooks can be found at the root of this repository: `setup-dotfiles.yml`. You can run the playbook like this:
```
ansible-playbook -K setup-dotfiles.yml
```

License
-------

MIT

