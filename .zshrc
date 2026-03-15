export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

zstyle ':omz:update' mode disabled

# ZSH Config
ZSH_THEME="agnoster"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="mm/dd/yyyy"

# Plugins
plugins=(
    git 
    zsh-autosuggestions 
    zsh-syntax-highlighting 
)

# Editor SSH
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='nano'
fi

source $ZSH/oh-my-zsh.sh

# Aliases
alias ls=lsd
alias cat=bat

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"

export SUPABASE_ACCESS_TOKEN="sb_publishable_ACJWlzQHlZjBrEguHvfOxg_3BJgxAaH"
