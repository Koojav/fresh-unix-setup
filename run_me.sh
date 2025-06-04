#!/bin/bash

section() {
  echo ""
  echo ""
  echo "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo "┃ $1"
  echo "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"  
  echo ""
  echo ""
}

# section "Gogh - Tomorrow Night theme"
# echo "252" | bash -c "$(wget -qO- https://git.io/vQgMr)"

section "Prettify GRUB"
git clone https://github.com/vinceliuice/grub2-themes.git
sudo ./grub2-themes/install.sh -s 2k

section "Install apt packages"
sudo apt update
sudo apt upgrade
sudo apt install build-essential libssl-dev zlib1g-dev libncurses5-dev libncursesw5-dev libreadline-dev libsqlite3-dev libffi-dev liblzma-dev tk-dev uuid-dev \
    python3-pip zsh htop git curl tldr snapd -y

section "Install GitHub CLI"
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
  && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
  && sudo apt update \
  && sudo apt install gh -y

section "Install pyenv (virtual environments for Python)"
curl https://pyenv.run | bash

section "Set ZSH as default shell with Antigen plugin manager"
sudo usermod -s /usr/bin/zsh $(whoami)
curl -L git.io/antigen > ~/antigen.zsh
cp .config/.zshrc ~/.zshrc
cp .config/.antigenrc ~/.antigenrc

section "Install Starship and copy config file based on Gruvbox-Rainbow theme"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip
unzip FiraCode.zip -d FiraCode
sudo mkdir -p /usr/share/fonts/truetype/fira-code-nerd
sudo cp FiraCode/* /usr/share/fonts/truetype/fira-code-nerd/
sudo fc-cache -fv
curl -sS https://starship.rs/install.sh | sh -s -- -y
cp .config/starship.toml ~/.config/starship.toml
sudo chsh -s $(which zsh)

section "Install Snap packages: Messaging"
# Discord is having issues lately, leaving for posterity but webclient is to be used from now on
# sudo snap install discord
# sudo snap connect discord:system-observe
sudo snap install slack --classic

section "Install Snap packages: Code development tools"
sudo snap install code --classic

section "Install Snap packages: DevOps tools"
sudo snap install terraform --classic
sudo snap install aws-cli --classic

# Removed from core services for now:
# sudo snap install kubectl --classic
# sudo snap install helm --classic

section "Install Chrome browser"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

section "Install Docker"
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

echo "\n\n########################"
echo "EXECUTE THIS COMMAND AFTER REBOOT:"
echo "sudo groupadd docker; sudo usermod -aG docker $USER"
echo "########################"
