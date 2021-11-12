#!/bin/sh


abort() {
  printf "%s\n" "$@"
  exit 1
}

# First check OS.
OS="$(uname)"
if [[ "${OS}" == "Linux" ]]
then
    ## install linux packages throug apt
    ## TODO
    echo "Installing Linux packages"
elif [[ "${OS}" == "Darwin" ]]
then
    ## Run Mac install script
    lib/installMacOSpackages.sh
elif [[ "${OS}" != "Darwin" ]]
then
  abort "This script is only supported on macOS and Linux."
fi
