#!/bin/sh

git clone --bare git@github.com:guiohm/dotFiles.git "$HOME/.dotfiles-repo"
function config {
   git --git-dir="$HOME/.dotfiles-repo/" --work-tree="$HOME" $@
}

echo "Backing up pre-existing dot files.";
mkdir -p .config-backup
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs sh -c 'for arg do mkdir -p .config-backup/`dirname "$arg"`; mv "$arg" .config-backup/"$arg"; done' _

config checkout
config config core.eol lf
config config core.autocrlf false
config config status.showUntrackedFiles no
config submodule init
config submodule update
