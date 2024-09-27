color-ssh() {
    trap "colorterm.sh" INT EXIT
    if [[ "$*" =~ "prod" ]]; then
        colorterm.sh prod
    elif [[ "$*" =~ "dev" ]]; then
        colorterm.sh dev
    else
        colorterm.sh other
    fi
    ssh $*
}

compdef _ssh color-ssh=ssh
alias ssh=color-ssh
