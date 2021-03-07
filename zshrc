# Basic prompt setup
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
autoload -Uz compinit; compinit
prompt pure

# Basic aliases
alias ls='ls --color=auto'
alias ll='ls -l'

# Git aliases
source $HOME/.zsh/git.zsh
source $HOME/.zsh/git.plugin.zsh

# keychain (WSL2)
if command -v keychain &> /dev/null
then
    eval `keychain --quiet --eval --agents ssh`
fi

# History config 
HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
#HISTDUP=erase               #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed

# Autojump (if it's installed)
[ -f /usr/share/autojump/autojump.zsh ] && source /usr/share/autojump/autojump.zsh

# nvm (if it's installed)
# Defer to first usage (see https://github.com/nvm-sh/nvm/issues/1978)
export NVM_DIR="$HOME/.nvm"
function _install_nvm() {
  unset -f nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This sets up nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # load nvm bash_completion
  nvm "$@"
}

function nvm() {
    _install_nvm "$@"
}
