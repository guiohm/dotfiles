# My dotfiles

Managed with [`chezmoi`](https://github.com/twpayne/chezmoi).

Install steps:

1. Download KeePassXC Database to ~/Sync/Database.kdbx
2. Run `chezmoi init guiohm`, or if `chezmoi` is not installed:

    ```bash
    /bin/bash -c "$(curl https://raw.githubusercontent.com/guiohm/dotfiles/main/install.sh)"
    ```

----

## Old Notes about my work dotfiles. Used on WSL Ubuntu

### Install ZSH
```
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### VIM: Update plugins

Launch `vim` and type `:PlugInstall`


### Install bat (A cat clone with syntax highlighting and Git integration) (https://github.com/sharkdp/bat)

```
wget https://github.com/sharkdp/bat/releases/download/v0.20.0/bat_0.20.0_amd64.deb
sudo dpkg -i bat*.deb
rm bat*.deb
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

### Install Git-delta (diff syntax highlighting) (https://github.com/dandavison/delta)

```
https://github.com/dandavison/delta
```

### Install tldr pages (Simplified and community-driven man pages) (https://github.com/tldr-pages/tldr)

```
npm install -g tldr
```

## Install GnuPg

```
sudo apt install gnupg
```

