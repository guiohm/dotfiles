### Just my work dotfiles. Used on WSL Ubuntu

New conf from scratch. Trying Fish shell.

## Pre-requesites

```
alias gitdotfiles='git --git-dir=$HOME/.dotfiles-repo/ --work-tree=$HOME'
```

Then the cloning steps are
```
git clone --bare <git-repo-url> $HOME/.dotfiles-repo
gitdotfiles checkout
gitdotfiles config --local status.showUntrackedFiles no
```

## Automated Checkout Script

```
curl -Lks http://<TODO: Replace after push on github>/.dotfiles-install/install.sh` | /bin/bash
```

See `.dotfiles-install/install.sh`
