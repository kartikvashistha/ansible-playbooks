fedora
=========

This is a simple ansible role to configure a new Fedora setup with my desired repositories and software packages.

How to run the role
-------------------

Here are the pre-requisites that are needed to be met before this role can be run on a Fedora machine:

### Package Installation
Install the ansible packages and the `community.general` ansible collection to enable flatpak module in the role:

```
sudo dnf install ansible ansible-core
ansible-galaxy collection install community.general
```

### Configuring the playbook
Configure & populate your playbook with the mandatory vars alongside any other optional vars that you desire. A sample `playbook.yml` can be found in this repository for reference.

If you would like to install groups, packages and/or flatpak apps different from the ones provided by this role, you can overide the default variables in your playbook like so:

```
- hosts: localhost
  become: true
  remote_user: <your_home_username>
  roles:
    - role: fedora
      vars:
        nvidia: true
        version: 38
        omz: true
        docker: true
        packages:
          - abc
          - xyz
        grouplist:
          - '@abc'
          - '@xyz'
        flatpak:
          - abc.efg.hij
```

Note, that if wish to supply additional vars to your playbook for adding other repos, you can either add them( or modify it completely) in the `vars/main.yml` file or move everything from `vars/main.yml` to `defaults/main.yml` and then add another section for `third_party_repos` listing all your repos to override the default vars, as demonstrated in the above example. This is due to how ansible [variable precedence](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#ansible-variable-precedence) works.

#### Role Variables

| Variable  | Value   | Description |
| ------------- | ------------- |-----|
| version  | (**required**) value is of type `int`  |  This variable is the Fedora distribution version number on which the role is executed. |
| nvidia  | (true or false) default value: false  | This variable should be set to true to install nvidia drivers. By default, it skips the `nvidia.yml` task.
| omz  | true or false, default value: false  | Boolean value that determines whether to do custom oh-my-zsh tasks. |
| docker  | true or false, default value: false | Boolean value that determines whether to install & configure docker.

### Running the playbook
The playbook can be run like so:
 ```
 ansible-playbook -K playbook.yml
 ```
Enter your [sudo] password to proceed.


License
-------

MIT
