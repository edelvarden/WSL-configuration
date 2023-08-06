# --------------------------------
# `apt update` downloads the most recent package information from the sources listed in the "/etc/apt/sources.list"
# `apt upgrade` command downloads and installs available upgrades of all packages currently installed on the system from the sources configured via sources.list.
# --------------------------------
sudo apt update -y && sudo apt upgrade -y


# --------------------------------
# Install nvm, node.js, and npm
# source: https://learn.microsoft.com/en-us/windows/dev-environment/javascript/nodejs-on-wsl#install-nvm-nodejs-and-npm
# --------------------------------

# 1. Install cURL (a tool used for downloading content from the internet in the command-line) with:
sudo apt-get install curl

# 2. Install nvm, with:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

# Install the current stable LTS release of Node.js (recommended for production applications):
sudo apt-get update -y
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install --lts

# Install the current release of Node.js (for testing latest Node.js features and improvements, but more likely to have issues):
# nvm install node

# Change the version of Node.js to the LTS version:
nvm use --lts

# List what versions of Node are installed:
# nvm ls


# --------------------------------
# Base installation
# --------------------------------
sudo apt install -y git neofetch unzip make python3-pip

# Install Yarn and TypeScript
npm install --global yarn typescript
