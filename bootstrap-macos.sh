#/bin/bash
set -e
# Bootstrap script that installs the initial brew and ansible dependencies

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install ansible

ansible-galaxy collection install community.general

