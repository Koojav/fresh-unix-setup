# This resource file assumes previous usage of: https://github.com/zsh-users/antigen
# Load Antigen
source ~/antigen.zsh
antigen init ~/.antigenrc

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Make local binaries accessible from anywhere, for eg. Poetry
export PATH="$HOME/.local/bin:$PATH"

# Pyenv setup
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# To learn about prompt customization visit: https://starship.rs/config/
eval "$(starship init zsh)"
