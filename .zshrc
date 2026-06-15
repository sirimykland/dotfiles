# Source oh-my-zsh config if available
if [ -f ~/.zsh_omz ] && [ -d "$HOME/.oh-my-zsh" ]; then
    . ~/.zsh_omz
fi

# Source custom aliases and local config after oh-my-zsh so they take
# precedence over anything oh-my-zsh defines.
[ -f ~/.zsh_aliases ] && . ~/.zsh_aliases
[ -f ~/.zsh_local ] && . ~/.zsh_local
[ -f ~/.profile ] && . ~/.profile

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

