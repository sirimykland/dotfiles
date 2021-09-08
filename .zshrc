# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/k32973/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="fletcherm"


export ZSH_DISABLE_COMPFIX=true
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


export AURORA_DIR="$HOME/.config/aurora"
[[ -d "$AURORA_DIR" ]] || mkdir -p $AURORA_DIR
export SKE_ROOT_CA="$AURORA_DIR/SKEROOTCA.pem"
[[ -s "$SKE_ROOT_CA" ]] || security find-certificate -c SKEROOTCA -p > $SKE_ROOT_CA

chmod 755 $SKE_ROOT_CA

[[ -d "$HOME/bin" ]] || mkdir -p $HOME/bin
export PATH=$PATH:/usr/local/bin:$HOME/bin
export NODE_EXTRA_CA_CERTS=$SKE_ROOT_CA
export HOMEBREW_CASK_OPTS="--appdir=~/Applications"

man(){
    command man $1 || $_ --help
}

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd.mm.yyyy"


# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8


# aliases and alias file
alias zshconfig="vim ~/.zshrc"

autoload -U compinit; compinit -u

source $HOME/.zsh_aliases
source $HOME/.zsh_local

