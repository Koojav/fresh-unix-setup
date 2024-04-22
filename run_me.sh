#!/bin/bash

echo "########################"
echo "# Install apt packages"
echo "########################"

sudo apt update
sudo apt upgrade
sudo apt install -y python3-pip zsh htop git curl tldr build-essential libssl-dev snapd

echo "\n\n########################"
echo "# Install GitHub CLI"
echo "########################"

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
  && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
  && sudo apt update \
  && sudo apt install gh -y

echo "\n\n########################"
echo "# Install pyenv (virtual environments for Python)"
echo "########################"

curl https://pyenv.run | bash

echo "\n\n########################"
echo "# Configure ZSH as default shell with Antigen plugin manager and fonts required for PowerLevel10k"
echo "########################"

wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -P ~/.local/share/fonts
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -P ~/.local/share/fonts
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -P ~/.local/share/fonts
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -P ~/.local/share/fonts

sudo usermod -s /usr/bin/zsh $(whoami)
curl -L git.io/antigen > ~/antigen.zsh
cp .zshrc ~/.zshrc
cp .antigenrc ~/.antigenrc
cp .p10k.zsh ~/.p10k.zsh

echo "\n\n########################"
echo "# Install Snap packages"
echo "########################"

sudo snap install code --classic
sudo snap install slack --classic

# Discord is having issues lately, leaving for posterity but webclient is to be used from now on
# sudo snap install discord
# sudo snap connect discord:system-observe

echo "\n\n########################"
echo "# Install Chrome browser"
echo "########################"

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

echo "\n\n########################"
echo "# Install Docker"
echo "########################"

sudo apt install docker.io

echo "\n\n########################"
echo "EXECUTE THIS COMMAND AFTER REBOOT:"
echo "sudo groupadd docker; sudo usermod -aG docker $USER"
echo "########################"
