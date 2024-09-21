#!/bin/bash

# exit immediately if password-manager-binary is already in $PATH
type keepassxc-cli >/dev/null 2>&1 && exit

case "$(uname -s)" in
Darwin)
    echo "unsupported OS"
    ;;
Linux)
    type pacman >/dev/null 2>&1 && ( sudo pacman -S keepassxc )
    # On Debian/Ubuntu => headless => prevent installing all X related dependencies.
    # So using the AppImage version helps
    type apt >/dev/null 2>&1 && ( sudo apt install libgl1 libfuse2 && \
        mkdir -p ~/bin && \
        APPIMAGEURL=$(curl -s https://api.github.com/repos/keepassxreboot/keepassxc/releases/latest \
            | grep "browser_download_url" | grep 'x86_64[.]AppImage' | head -n 1 | cut -d '"' -f 4) && \
        curl -L -o ~/bin/keepassxc $APPIMAGEURL && \
        printf '#!/bin/bash \n keepassxc cli $@\n' > ~/bin/keepassxc-cli && \
        chmod +x ~/bin/keepassxc* && \
        export PATH="$PATH:~/bin" && \
        echo "Keepassxc-cli installed into ~/bin")
    ;;
*)
    echo "unsupported OS"
    exit 1
    ;;
esac
