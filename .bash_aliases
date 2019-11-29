# Bash aliases, kept alfabetically
alias brc='source /home/cassarossa/itk/sirmy/.bashrc'

alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# perform 'ls' after 'cd' if successful.
cdls() {
  builtin cd "$*"
  RESULT=$?
  if [ "$RESULT" -eq 0 ]; then
      ls
  fi
}
alias cdls='cdls'

# Clear the terminal
alias cls='clear'

alias diff='diff --color=auto'

export GREP_COLOR="1;32"
alias grep='grep --color=auto'
alias gerp='grep'

alias sugit='sudo -E git'
alias suvim='sudo -E vim'


alias ls='ls --color=auto'
alias ls-la='ls -la'
alias lsla='ls -la'

alias takeover='tmux detach -a'