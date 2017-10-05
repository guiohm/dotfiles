## Just my work dotfiles. Used on WSL Ubuntu

New conf from scratch. Trying Fish shell.

### Automated Checkout Script

```
curl -Lks https://raw.githubusercontent.com/guiohm/myWork_WSL_DotFiles/master/.dotfiles-install/install.sh | /bin/bash
```

See `.dotfiles-install/install.sh`

### VIM: Update plugins

Launch `vim` and type `:PlugInstall`

### Or Manually

```
alias gitdotfiles='git --git-dir=$HOME/.dotfiles-repo/ --work-tree=$HOME'
git clone --bare git@github.com:guiohm/myWork_WSL_DotFiles.git $HOME/.dotfiles-repo
gitdotfiles checkout
gitdotfiles config --local status.showUntrackedFiles no
```

## Install Fish on WSL Ubuntu 14.04

apt-get only has the 2.0 version of Fish. But Poweline needs 2.1+. So here are the steps to install Fish 2.6
```
wget https://launchpad.net/~fish-shell/+archive/ubuntu/release-2/+files/fish-common_2.6.0-1~trusty_all.deb
wget https://launchpad.net/~fish-shell/+archive/ubuntu/release-2/+files/fish_2.6.0-1~trusty_amd64.deb
dpkg -i fish-common_2.6.0-1~trusty_all.deb fish_2.6.0-1~trusty_amd64.deb
```

### Install powerline

From memory, the steps should roughly be something like...
- Install pip
- `pip install powerline-status`
- then inside fish `powerline-fish && powerline-setup`
