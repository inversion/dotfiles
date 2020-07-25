fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure
source $HOME/.zsh/git.zsh
source $HOME/.zsh/git.plugin.zsh


# keychain (WSL2)
if command -v keychain &> /dev/null
then
    eval `keychain --quiet --eval --agents ssh`
fi
