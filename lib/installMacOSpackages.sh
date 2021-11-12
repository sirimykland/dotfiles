# HomeBrew
if test ! $(which brew); then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    # Update homebrew
    echo "Updating homebrew..." && brew update
fi

# Apps to install Globally
apps=(
  # Casks - UI-based apps
  iterm2
  rectangle
  postman
  google-chrome
  slack
  spotify
  visual-studio-code
  intellij-idea
  # Formulae
  kotlin
  docker
  nvm
)

brew_exist() {
  if brew list -1 | grep $1 &>/dev/null; then 
    return 0
  else
    return 1
  fi
}

brew_install() {
    if brew_exist $1; then
        echo "${1} is already installed"
    else
        echo "\nInstalling $1"
        brew install $1 && echo "\n"
    fi
}

for app in ${apps[@]}; do
  brew_install $app
done

# Post brew install
brew cleanup

# npm and node
if test $(which node) && brew_exist node; then
    echo "Uninstalling Node..."
    brew uninstall --ignore-dependencies node 
    brew uninstall node 
fi
if test brew_exist nvm; then
  nvm install-latest-npm && echo "Installed npm ${npm -v}"
  nvm install 12 && echo "Installed node ${nvm list | grep v12 -m1}"
  nvm install 14 && echo "Installed node ${nvm list | grep v14 -m1}"
fi

# oh-my-zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
#git checkout -- .zshrc
mv ~/.zshrc.pre-oh-my-zsh  ~/.zshrc
source ~/.zshrc
