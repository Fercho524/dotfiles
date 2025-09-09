export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="agnoster"

# Updates
zstyle ':omz:update' frequency 30

# Corrections
ENABLE_CORRECTION="true"

# Plugins
plugins=(git zsh-syntax-highlighting  zsh-autosuggestions  )

source $ZSH/oh-my-zsh.sh

# Editor
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='nano'
fi

# Aliases
alias cat=bat
alias ls=lsd

# Miniconda
source ~/.miniconda3/bin/activate
source /usr/share/nvm/init-nvm.sh

# Load Angular CLI autocompletion.
source <(ng completion script)
