# OH MY ZSH
export ZSH="/home/fercho/.oh-my-zsh"
export PATH=$HOME/.local/bin:/usr/local/bin:$PATH
export CLASSPATH=/usr/lib/jvm/
export JAVA5_BOOTCLASSES=/usr/lib/jvm/java-17-openjdk/lib
export LANG=es_MX.UTF-8

# ZSH CONFIG AND PLUGINS
ZSH_THEME="aussiegeek"
plugins=(git)
source $ZSH/oh-my-zsh.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Samba Mount $SambaShare $mountDestiny
function mountsmb(){
    sudo mount.cifs //192.168.1.68/RecursosSistema Biblioteca \
    -o user=pi,\
    pass=ganso524,\
    uid=1000,gid=984,\
    forceuid,forcegid
}

# Config aliases
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"

# Program Aliases
alias ls=exa
alias cls=clear
alias cat=ccat
alias tree=exa -T

# Config aliases
alias bspwmconfig="nvim ~/.config/bspwm/bspwmrc"
alias sxhkdconfig="nvim ~/.config/sxhkd/sxhkdrc"
alias i3config="nvim ~/.config/i3/config"
alias swayconfig="nvim ~/.config/sway/config"alias smbMount=sudo mount.cifs //192.168.1.68/Shared Shared -o user=pi,pass=ganso524,uid=1000,gid=984,forceuid,forcegid
