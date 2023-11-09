###########################################################################################
#                                     S Y S T E M
###########################################################################################


export LANG=es_MX.UTF-8
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$PATH:/home/fercho/.local/bin"

export ARCHFLAGS="-arch x86_64"

export CLASSPATH=/usr/lib/jvm/
export JAVA5_BOOTCLASSES=/usr/lib/jvm/java-17-openjdk/lib



###########################################################################################
#                                     O H M Y Z S H
###########################################################################################


export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="aussiegeek"
CASE_SENSITIVE="false"
plugins=(git)

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


###########################################################################################
#                                     A L I A S E S
###########################################################################################

# Config aliases
alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"

# Program Aliases
alias ls="exa --icons"
alias cls=clear
alias cat=bat


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/fercho/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/fercho/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/fercho/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/fercho/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<