# Basic prompt setup
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

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

# Autojump
[ -f /usr/share/autojump/autojump.zsh ] && source /usr/share/autojump/autojump.zsh

# nvm (if it's installed)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion