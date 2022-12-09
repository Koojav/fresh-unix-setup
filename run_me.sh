#!/bin/bash

# Install apt packages
sudo apt update
sudo apt upgrade
sudo apt install -y python3-pip zsh htop git curl tldr build-essential libssl-dev

# Install pyenv (virtual environments for Python)
curl https://pyenv.run | bash

# Set ZSH as default shell
sudo usermod -s /usr/bin/zsh $(whoami)

# Install snap packages
sudo snap install pycharm-community --classic
sudo snap install slack --classic
sudo snap install discord
sudo snap connect discord:system-observe

# Install Antigen (ZSH plugin manager)
curl -L git.io/antigen > ~/antigen.zsh

# Copy configuration scripts
cp .zshrc ~/.zshrc
cp .antigenrc ~/.antigenrc
cp .p10k.zsh ~/.p10k.zsh

# Install Chrome browser
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Info for the user
echo ""
echo "EXECUTE THOSE COMMANDS AFTER REBOOT:"
echo ""
echo "sudo groupadd docker"
echo "sudo usermod -aG docker $USER"
