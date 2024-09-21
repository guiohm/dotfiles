#!/bin/bash

# exit immediately if needed binaries are already in $PATH
command -v keepassxc-cli &> /dev/null;
command -v git-delta &> /dev/null; && exit

case "$(uname -s)" in
Darwin)
    echo "unsupported OS"
    ;;
Linux)
    command -v pacman &> /dev/null; && ( sudo pacman -S keepassxc git-delta)

    if command -v apt &> /dev/null; then
        # On Debian/Ubuntu => headless => prevent installing all X related dependencies of keepassxc.
        # So using the AppImage version helps
        echo -e "\n==> Installing dependencies for Keepassxc-cli...\n\n"
        sudo apt install libgl1 libfuse2
        mkdir -p ~/bin
        curl -L -o ~/bin/keepassxc --location \
            $(curl -s https://api.github.com/repos/keepassxreboot/keepassxc/releases/latest \
            | grep "browser_download_url" | grep 'x86_64[.]AppImage' | head -n 1 | cut -d '"' -f 4)
        printf '#!/bin/bash \n keepassxc cli $@\n' > ~/bin/keepassxc-cli
        chmod +x ~/bin/keepassxc*
        export PATH="$PATH:~/bin"
        echo -e "\nKeepassxc-cli installed into ~/bin\n\n"
        
        echo -e "\nInstalling git-delta...\n\n"
        temp=$(mktemp)
        curl -L -o $temp --location \
            $(curl -s https://api.github.com/repos/dandavison/delta/releases/latest \
            | grep "browser_download_url" | grep 'git-delta_.*_amd64\.deb' | head -n 1 | cut -d '"' -f 4)
        sudo dpkg -i $temp
        rm $temp
        
        exit
    fi
    echo "Unsupported package manager."
    exit 1
    ;;
*)
    echo "unsupported OS"
    exit 1
    ;;
esac
