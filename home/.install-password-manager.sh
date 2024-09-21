#!/bin/sh

# exit immediately if password-manager-binary is already in $PATH
type keepassxc-cli >/dev/null 2>&1 && exit

case "$(uname -s)" in
Darwin)
    echo "unsupported OS"
    ;;
Linux)
    type pacman >/dev/null 2>&1 && ( sudo pacman -S keepassxc )
    type apt >/dev/null 2>&1 && ( sudo apt install keepassxc )
    ;;
*)
    echo "unsupported OS"
    exit 1
    ;;
esac
