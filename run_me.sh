#!/bin/bash

echo "########"
echo "# Install apt packages"
echo "########"

sudo apt update
sudo apt upgrade
sudo apt install -y python3-pip zsh htop git curl tldr build-essential libssl-dev snapd

echo "########"
echo "# Install pyenv (virtual environments for Python)"
echo "########"

curl https://pyenv.run | bash

echo "########"
echo "# Configure ZSH as default shell with Antigen plugin manager and fonts required for PowerLevel10k"
echo "########"

wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -P ~/.local/share/fonts
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -P ~/.local/share/fonts
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -P ~/.local/share/fonts
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -P ~/.local/share/fonts

sudo usermod -s /usr/bin/zsh $(whoami)
curl -L git.io/antigen > ~/antigen.zsh
cp .zshrc ~/.zshrc
cp .antigenrc ~/.antigenrc
cp .p10k.zsh ~/.p10k.zsh

echo "########"
echo "# Install Snap packages"
echo "########"

sudo snap install code --classic
sudo snap install slack --classic
sudo snap install discord
sudo snap connect discord:system-observe

echo "########"
echo "# Install Chrome browser"
echo "########"

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

echo "########"
echo "# Install Docker"
echo "########"

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Info for the user
echo "########"
echo "EXECUTE THIS COMMAND AFTER REBOOT:"
echo "sudo groupadd docker; sudo usermod -aG docker $USER"
echo "########"
