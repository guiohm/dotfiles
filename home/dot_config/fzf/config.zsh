FD_EXCLUDES="--exclude .git --exclude node_modules --exclude .cargo --exclude .asdf \
	--exclude .cache --exclude .debug --exclude .steam --exclude steam-runtime"

export FZF_DEFAULT_OPTS='--no-height --no-reverse --border --scroll-off=21 --keep-right'
#export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*"'
export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix --hidden $FD_EXCLUDES"
export FZF_COMPLETION_TRIGGER='::'
# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden ${(z)FD_EXCLUDES} . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden ${(z)FD_EXCLUDES} . "$1"
}

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'lsd --tree --color=always --depth 1 {}' --bind 'ctrl-l:change-preview-window(up|25%|hidden|)' "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview 'bat -n --color=always {}' --bind 'ctrl-l:change-preview-window(up|25%|hidden|)' "$@" ;;
  esac
}

export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND

# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --preview '(bat -n --color=always {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'
  --bind 'ctrl-l:change-preview-window(up|25%|hidden|)'"

export FZF_ALT_C_COMMAND="fd --type d --strip-cwd-prefix --hidden $FD_EXCLUDES"

# Print tree structure in the preview window
export FZF_ALT_C_OPTS="
  --preview 'lsd --tree --color=always --depth 1 {}'
  --bind 'ctrl-l:change-preview-window(up|25%|hidden|)'"

DISABLE_FZF_AUTO_COMPLETION="false"
DISABLE_FZF_KEY_BINDINGS="false" # Ctrl-T Ctrl-R Alt-C

# Custom uses

# fo: open a file with enter or ctrl-e to edit
fo() {
 IFS=$'\n' out=("$(fzf-tmux --query="${(j: :)@}" --exit-0 --expect=ctrl-o,ctrl-e)")
 key=$(head -1 <<< "$out")
 file=$(head -2 <<< "$out" | tail -1)
 if [ -n "$file" ]; then
 [ "$key" = ctrl-e ] && ${EDITOR:-vim} || xdg-open "$file"
 fi
}
