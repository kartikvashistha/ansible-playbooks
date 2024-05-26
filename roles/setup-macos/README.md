setup-macos
=========

A simple Ansible role to setup my macOS machine.


Requirements
------------

Homebrew and ansible needs to be installed as a minimum.
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install ansible
```

Role Variables
--------------

- **brew_pkgs**: (Optional) List of packages that are installed via homebrew.

- **brew_casks**: (Optional) List of GUI packages that are installed via homebrew. 

License
-------

BSD
