# Defined in - @ line 0
function gitdotfiles --description 'alias gitdotfiles /usr/bin/git --git-dir=/home/guiohm/.dotfiles-repo/ --work-tree=/home/guiohm'
	/usr/bin/git --git-dir=/home/guiohm/.dotfiles-repo/ --work-tree=/home/guiohm $argv;
end
