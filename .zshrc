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
    fast-syntax-highlighting
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

# Node JS
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/fercho/.miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/fercho/.miniconda/etc/profile.d/conda.sh" ]; then
        . "/home/fercho/.miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/home/fercho/.miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
#<<< conda initialize <<<

