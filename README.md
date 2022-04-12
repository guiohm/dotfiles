## Just my work dotfiles. Used on WSL Ubuntu

New conf from scratch. Trying Fish shell.

### Automated Checkout Script

```
curl -Lks https://raw.githubusercontent.com/guiohm/myWork_WSL_DotFiles/master/.dotfiles-install/install.sh | /bin/bash
```

See `.dotfiles-install/install.sh`

### Or Manually

```
alias gitdotfiles='git --git-dir=$HOME/.dotfiles-repo/ --work-tree=$HOME'
git clone --bare git@github.com:guiohm/myWork_WSL_DotFiles.git $HOME/.dotfiles-repo
gitdotfiles checkout
gitdotfiles config --local status.showUntrackedFiles no
```

### Install ZSH
```
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Install Keychain (ssh-agent wrapper)
```
sudo apt install keychain
```

### VIM: Update plugins

Launch `vim` and type `:PlugInstall`

### Install Yarn (using fnm to install node)
```
sudo apt install unzip
curl -fsSL https://fnm.vercel.app/install | bash
source ~/.zshrc
# TODO handle completions : fnm completions --shell zsh
# install node.js
fnm install --lts
npm install -g yarn
```

### Install Starship (https://github.com/starship/starship)

```
curl -sS https://starship.rs/install.sh | sh
```


### Install zsh autosuggestions plugin (https://github.com/zsh-users/zsh-autosuggestions)

```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

### Install zsh fzf plugin (https://github.com/unixorn/fzf-zsh-plugin#oh-my-zsh)

```
git clone https://github.com/unixorn/fzf-zsh-plugin.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-zsh-plugin
```

### Install zsh syntax highlighting plugin (https://github.com/zsh-users/zsh-syntax-highlighting)

```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### Install zsh k plugin: dir list with git features (https://github.com/supercrabtree/k)

```
git clone https://github.com/supercrabtree/k ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/k
```

## [Not used] Install Fish on WSL Ubuntu 14.04

apt-get only has the 2.0 version of Fish. But Poweline needs 2.1+. So here are the steps to install Fish 2.6
```
sudo apt-get install bc &&
wget https://launchpad.net/~fish-shell/+archive/ubuntu/release-2/+files/fish-common_2.6.0-1~trusty_all.deb &&
wget https://launchpad.net/~fish-shell/+archive/ubuntu/release-2/+files/fish_2.6.0-1~trusty_amd64.deb &&
sudo dpkg -i fish-common_2.6.0-1~trusty_all.deb fish_2.6.0-1~trusty_amd64.deb
```

### [Not used] Install powerline

From memory, the steps should roughly be something like...
- Install pip : `sudo apt-get install python3-pip`
- `pip install powerline-status`
- then inside fish `powerline-fish && powerline-setup`
