
# Enable custom pythonrc for autocomplete
# export PYTHONSTARTUP=$HOME/.pythonrc

# source ~/.git-completion.bash

# PATH="$PATH"

if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add
fi

#-------------------
# Personnal Aliases
#-------------------
alias du='du -kh'
alias durec="du -hs ./* | grep '[GM]'"
alias df='df -kTh'
alias mkdir='mkdir -p'
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias h='history'
alias r='fc -s'
alias svnup='svn up --ignore-externals'
alias svnst='svn st --ignore-externals'
alias celdev='celeryd -E -B --config=celeryconfig.celeryconfig --loglevel=DEBUG'
alias g='git'
alias gba='git branch -r && git branch'
alias gt='git status --show-stash'
alias gc='git commit -v'
alias gci='git commit -m'
alias gaci='git commit -am'
alias gcom='git checkout master'
alias gcloc='cloc $(git ls-files)' # npm install -g cloc
alias gd='git diff'
alias gdc='git diff --cached'
alias gitlog="git log origin/staging --not origin/production --decorate --pretty=format:'%h;;%s;%an;%ai'"
alias gitpushmaster2staging='git co staging && git pull && git co master && git pull && git merge staging && git push && git push origin master:staging'
alias gmergeprod='git co production && git pull && git push && git co staging && git pull && git merge production && git push && git co master && git pull && git merge staging && git push'
alias gmergemaster='CURR_BRANCH=$(git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3-) && git co master && git pull && git co $CURR_BRANCH && git merge master && git push'
alias gclean='git checkout master && git pull && git remote prune origin && git branch --merged master | egrep  -v "(master|staging|production)$" | xargs git branch -d && git gc'
alias gl='git pull -v'
alias gp='git push'
alias gpushmaster='git push origin master:production && git push origin master:staging'
alias glp='git pull && git push'
alias gstl='git stash && git pull && git stash pop'
alias gstp='git stash && git pull && git push && git stash pop'
alias gsr='make reset_submodules'
alias msh="mosh --server='\''LC_CTYPE=en_US.UTF-8 mosh-server'\'"
alias w4ubuild='~/work4us/symfony doctrine:build --all --application=facebook --and-load && ~/work4us/symfony work4us:update-db && ~/work4us/symfony work4us:mongodb-setup --drop-database=true &&  ~/work4us/symfony work4us:sync-mongo'
alias j4mebuild='~/work4schools/symfony doctrine:build --application=facebook --all --and-load && ~/work4schools/symfony jobs4me:update-db'
alias wprodsql='mysql --defaults-file=/home/web/.my.lab4.cnf --prompt="[Work4Us-prod] > " -vvv --database="work4us"'
alias jprodsql='mysql --defaults-file=/home/web/.my.lab6.cnf --prompt="[Jobs4Me-prod] > " -vvv --database="work4schools"'
alias devsql='mysql --prompt="(devsql) [\d]> " -vvv'
alias jdevsql='mysql --prompt="[Jobs4Me-dev] > " -vvv --database="gbordiau_work4schools"'
alias wdevsql='mysql --prompt="[Work4Us-dev] > " -vvv --database="gbordiau_work4us"'
alias mongolab='mongo dbh13.mongolab.com:27137/gbordiau_jobs4me2 -u gbordiau -p sewudyeyoine'
alias mongosyncdevpage='./symfony mongo:sync --env=dev --page_id=159068240784310 --sync_date=1970-01-01 && ./symfony mongo:update-cache --env=dev --page_id=159068240784310 --force=1'
alias tailj='tail -f ~/jobs4me/log/j4m_dev.log'
alias tailw='tail -f ~/work4us/log/w4u_dev.log'
alias japi="curl -v --user 159068240784310:ak42 --data '@doc/test/job_add_j4m.xml' http://api-dev.j4m.gbordiau.lab3.work4labs.com/v2/pages/159068240784310/jobs"
alias wapi="curl -v --user 159068240784310:ak42 --data '@doc/test/job_add.xml' http://api-dev.work4us.gbordiau.lab3.work4labs.com/v2/pages/159068240784310/jobs"

alias code='/c/Program\ Files/Microsoft\ VS\ Code\ Insiders/bin/code-insiders'

# Specific dotfiles git repo alias
alias gitdotfiles='git --git-dir="$HOME/.dotfiles-repo/" --work-tree="$HOME"'

#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls)
#-------------------------------------------------------------
alias ll="ls -Al --group-directories-first"
alias ls='ls -hF --color'  # add colors for filetype recognition
alias la='ls -Al'          # show hidden files
alias lx='ls -lXB'         # sort by extension
alias lk='ls -lSr'         # sort by size, biggest last
alias lc='ls -ltcr'        # sort by and show change time, most recent last
alias lu='ls -ltur'        # sort by and show access time, most recent last
alias lt='ls -ltr'         # sort by date, most recent last
alias lm='ls -al |more'    # pipe through 'more'
alias lr='ls -lR'          # recursive ls
alias tree='tree -Csu'     # nice alternative to 'recursive ls'
alias lsd='ls -ld *(/)'                 # only show directories
alias lad='ls -ld .*(/)'                # only show dot-directories
alias lsa='ls -a .*(.)'                 # only show dot-files
alias lsbig='ls -lSh *(.) | head'       # display the biggest files
alias lssmall='ls -Sl *(.) | tail'      # display the smallest files
alias lsnew='ls -rtl *(.) | tail'       # display the newest files
alias lsold='ls -rtl *(.) | head'       # display the oldest files


#-------------------------------------------------------------
# Fautes de frappe
#-------------------------------------------------------------
alias xs='cd'
alias vf='cd'
alias moer='more'
alias moew='more'
alias kk='ll'
alias chwon='chown'

#-------------------------------------------------------------
# .NET
#-------------------------------------------------------------

function efCoreDropDbAndRebuildModel() {
    echo -e "\E[33m \n\nJe vais dropper la Db" && tput sgr0 &&
    echo dotnet ef database drop --no-build --force &&
    dotnet ef database drop --no-build --force &&
    echo -e "\E[33m \n\nMaintenant je supprime les migrations existantes"&& tput sgr0 &&
    echo rm Migrations/*.cs
    rm Migrations/*.cs
    echo -e "\E[33m \n\nPuis je crée un nouveau snapshot et la migration initiale"&& tput sgr0 &&
    echo dotnet ef migrations add init &&
    dotnet ef migrations add init &&
    echo -e "\E[33m \n\nEt pour finir je recrée la db et les tables"&& tput sgr0 &&
    echo dotnet ef database update init
    dotnet ef database update init
}

#-------------------------------------------------------------
# File & string-related functions:
#-------------------------------------------------------------

# Find a file with a pattern in name:
function ff() { find . -type f -iname '*'$*'*' -ls ; }

# Find a file with pattern $1 in name and Execute $2 on it:
function fe()
{ find . -type f -iname '*'${1:-}'*' -exec ${2:-file} {} \;  ; }

# mme chose pour dossiers :
function de()
{ find . -type d -iname '*'${1:-}'*' -exec ${2:-} {} \;  ; }

# Find a pattern in a set of files and highlight them:
# (needs a recent version of egrep)
function fstr()
{
    OPTIND=1
    local case=""
    local usage="fstr: find string in files.
Usage: fstr [-i] \"pattern\" [\"filename pattern\"] "
    while getopts :it opt
    do
        case "$opt" in
        i) case="-i " ;;
        *) echo "$usage"; return;;
        esac
    done
    shift $(( $OPTIND - 1 ))
    if [ "$#" -lt 1 ]; then
        echo "$usage"
        return;
    fi
    find . -type f -name "${2:-*}" -print0 | \
    xargs -0 egrep --color=always -sn ${case} "$1" 2>&- | less

}

# Find a pattern in a set of files and replace it
function strreplace()
{
    OPTIND=1
    local case=""
    local usage="strreplace: find and replace string in files.
Usage: fstr [-i] \"pattern\" \"replacement\" [\"filename pattern\"] "
    while getopts :it opt
    do
        case "$opt" in
        i) case="-i " ;;
        *) echo "$usage"; return;;
        esac
    done
    shift $(( $OPTIND - 1 ))
    if [ "$#" -lt 1 ]; then
        echo "$usage"
        return;
    fi
    find . -type f -name "${3:-*}" -print0 | \
    xargs -0 perl -pi -w -e "s/$1/$2/g;" 2>&-

}

function gitbr()
{
    local usage="$0: just an alias to 'git push origin source_branch:new_branch'
    where you specify the <source_branch> as the first argument (ex: master) and <new_branch> as 2nd arg."

    if [ "$#" -ne 2 ]; then
        echo "$usage"
        return;
    fi
    git push origin $1:$2 &&
    git co $2
}

function gitbrdel()
{
    git push origin :$1
    git branch -D $1
}

function gbrmaster()
{
    local usage="Yo Dawg, I heard you like alias, so I make an alias on an alias of 'git push origin old_br:new_br'
        it automatically prepend your login to the new branche. first arg is the task_number, second arg is the comment"

    if [ "$#" -ne 2 ]; then
    echo "$usage"
    return;
    fi

    gitbr master `echo $(whoami)"/"$1"/"$(echo $2 | sed  -e 's/ /_/g')`
}

function gbrstaging()
{
    local usage="Yo Dawg, I heard you like alias, so I make an alias on an alias of 'git push origin old_br:new_br'
        it automatically prepend your login to the new branche. first arg is the task_number, second arg is the comment"

    if [ "$#" -ne 2 ]; then
    echo "$usage"
    return;
    fi

    gitbr staging `echo $(whoami)"/"$1"/"$(echo $2 | sed  -e 's/ /_/g')`
}

function get_jira_task_from_current_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' | cut -d'/' -f 2
}

#function gci() {
#    MSG="$(get_jira_task_from_current_git_branch): $1"
#    git commit -m "$MSG"
#}

#function gaci() {
#    MSG="$(get_jira_task_from_current_git_branch): $1"
#    git commit -am "$MSG"
#}

function cuttail() # cut last n lines in file, 10 by default
{
    nlines=${2:-10}
    sed -n -e :a -e "1,${nlines}!{P;N;D;};N;ba" $1
}

function lowercase()  # move filenames to lowercase
{
    for file ; do
        filename=${file##*/}
        case "$filename" in
        */*) dirname==${file%/*} ;;
        *) dirname=.;;
        esac
        nf=$(echo $filename | tr A-Z a-z)
        newname="${dirname}/${nf}"
        if [ "$nf" != "$filename" ]; then
            mv "$file" "$newname"
            echo "lowercase: $file --> $newname"
        else
            echo "lowercase: $file not changed."
        fi
    done
}


function swap()  # Swap 2 filenames around, if they exist
{                #(from Uzi's bashrc).
    local TMPFILE=tmp.$$

    [ $# -ne 2 ] && echo "swap: 2 arguments needed" && return 1
    [ ! -e $1 ] && echo "swap: $1 does not exist" && return 1
    [ ! -e $2 ] && echo "swap: $2 does not exist" && return 1

    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

# TASK ALERTS
#
# Find the pid of a long
#  running process(say 253) and
#  on a different terminal:
#  $ aldo 253
#
#  Will treat you to a pleasant beep when the task finishes.

function aldo {
    while ps -ao pid | grep -q " ${1}$";
        do sleep 1 ;
    done;
    echo $'\a';
}

function extract()
{
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xvjf $1     ;;
             *.tar.gz)    tar xvzf $1     ;;
             *.bz2)       bunzip2 $1      ;;
             *.rar)       unrar x $1      ;;
             *.gz)        gunzip $1       ;;
             *.tar)       tar xvf $1      ;;
             *.tbz2)      tar xvjf $1     ;;
             *.tgz)       tar xvzf $1     ;;
             *.zip)       unzip $1        ;;
             *.Z)         uncompress $1   ;;
             *.7z)        7z x $1         ;;
             *)           echo >&2 "extract automatise les commandes suivantes:
        .tar.bz2    >   tar xvjf
        .tar.gz     >   tar xvzf
        .bz2        >   bunzip2
        .rar        >   unrar x
        .gz         >   gunzip
        .tar        >   tar xvf
        .tbz2       >   tar xvjf
        .tgz        >   tar xvzf
        .zip        >   unzip
        .Z          >   uncompress
        .7z         >   7z x" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

#function disktemp() {
#  for i (/dev/[hs]d?) {
#    smartctl -d ata -a $i | \
#    awk --assign "i=${i#/dev/}" \
#    '/Temperature/ {print i " " $10 "C"}'
#  }
#}

#function diskstate() {
#  for i (/dev/[hs]d?) {
#    hdparm -C $i | \
#    awk --assign "i=${i#/dev/}" \
#    '/drive state is/ {print i " " $4}'
# }
#}

function beer()
{
  echo "         _.._..,_,_"
  echo "        (          )"
  echo "         ]~,\"-.-~~["
  echo "       .=])' (;  (["
  echo "       | ]:: '    ["
  echo "       '=]): .)  (["
  echo "         |:: '    |"
  echo "          ~~----~~"
}


#-------------------------------------------------------------
# Process/system related functions:
#-------------------------------------------------------------


function my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,bsdtime,command ; }
function pp() { my_ps f | awk '!/awk/ && $0~var' var=${1:-".*"} ; }


function killps()                 # Kill by process name.
{
    local pid pname sig="-TERM"   # Default signal.
    if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
        echo "Usage: killps [-SIGNAL] pattern"
        return;
    fi
    if [ $# = 2 ]; then sig=$1 ; fi
    for pid in $(my_ps| awk '!/awk/ && $0~pat { print $1 }' pat=${!#} ) ; do
        pname=$(my_ps | awk '$1~var { print $5 }' var=$pid )
        if ask "Kill process $pid <$pname> with signal $sig?"
            then kill $sig $pid
        fi
    done
}

#-------------------------------------------------------------
# Greeting, motd etc...
#-------------------------------------------------------------

# Define some colors first:
red='\e[0;31m'
RED='\e[1;31m'
blue='\e[0;34m'
BLUE='\e[1;34m'
cyan='\e[0;36m'
CYAN='\e[1;36m'
JAUNE='\[\033[33m\]'
ROUGE='\[\033[01;31m\]'
VERT='\[\033[1;32m\]'
BLEU='\[\033[1;34m\]'
NC="\[\033[0m\]"                  # No Color
NC2='\[\033[00m\]'              # No Color

# --> Nice. Has the same effect as using "ansi.sys" in DOS.


# Looks best on a terminal with black background.....
# echo -e "${CYAN}This is BASH ${RED}${BASH_VERSION%.*}\
# ${CYAN} - DISPLAY on ${RED}$DISPLAY${NC}\n"
# date
if [ -x /usr/bin/fortune ]; then
    /usr/bin/fortune -c     # Makes our day a bit more fun.... :-)
fi

# tt=`date +"%T" | cut -c1-2`
# NAME=`grep "^$LOGNAME" /etc/passwd | awk -F: ' {print $5}'`
# echo -e "\n\n\n"
#tput smso
#if [ $tt -gt 0 -a $tt -lt 7 ]
#then
#echo " Salut $NAME !!    Et euh... Dormir, t'y penses ? "
#elif [ $tt -gt 7 -a $tt -le 14 ]
#then
#echo " Bonjour $NAME !!   Bien dormi ? "
#elif [ $tt -gt 14 -a $tt -le 19 ]
#then
#echo " Cher $NAME !! La journée se passe bien ? "
#else
#echo " Bonsoir $NAME !!   Je vois que tu passes une bonne soirée ! "
#fi
#tput rmso
#echo -e "\n\n"

function _exit()        # Function to run upon exit of shell.
{
    echo -e "${CYAN}Goude baille ! Scie iou soune !${NC}"
}
trap _exit EXIT

#-------------------------------------------------------------
# Shell Prompt
#-------------------------------------------------------------


# if [[ "${DISPLAY%%:0*}" != "" ]]; then
#     HILIT=${red}   # remote machine: prompt will be partly red
# else
#     HILIT=${cyan}  # local machine: prompt will be partly cyan
# fi

#  --> Replace instances of \W with \w in prompt functions below
#+ --> to get display of full path name.

function fastprompt()
{
    unset PROMPT_COMMAND
    case $TERM in
#        *term | rxvt )
        *)
            PS1="${VERT}[\h]$NC \W > \[\033]0;\${TERM} [\u@\h] \w\007\]" ;;
        linux )
            PS1="${HILIT}[\h]$NC \W > " ;;
        *)
            PS1="[\h] \W > " ;;
    esac
}


_load()
{
    RETURN=$?
    LOAD=$(uptime|sed -e "s/.*: \([^,]*\).*/\1/" -e "s/ //g")
}

function powerprompt()
{

  #  PROMPT_COMMAND=_load
    case $TERM in
#        *term | rxvt*  )
        *)
            if [[ ${EUID} == 0 ]] ; then
                PS1="${BLEU}[\A-\#]${ROUGE}\u@\h ${BLEU}\w €${NC2} "
            else
                PS1="${BLEU}[\A-\#]${VERT}\u@\h ${BLEU}\w €${NC2} "
            fi
            ;;
        linux )
            PS1="${HILIT}[\A - \$LOAD]$NC\n[\u@\h \#] \W > " ;;
        *off )
            PS1="[\A - \$LOAD]\n[\u@\h \#] \W > " ;;
    esac
}

# git/svn prompt functions
# . ~/.git_svn_bash_prompt

function get_git_svn_info () {
  # Set the PROMPT_SYMBOL variable. We do this first so we don't lose the
  # return value of the last command.
#  set_prompt_symbol $?
#  PROMPT_SYMBOL=$(_get_prompt_symbol)

  # actualise system load value
  _load

  unset SVN_REV

  # Set the BRANCH variable.
  if is_git_repository ; then
    set_git_branch
#    BRANCH=$(__git_ps1 ' (%s)')
  elif is_svn_repository ; then
    set_svn_branch
    set_svn_rev
  else
    BRANCH=''
  fi

  # Set the bash prompt variable.
  # PS1="\u@\h \w ${BRANCH}${PROMPT_SYMBOL} "
}

parse_git_branch() {      
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function powerpromptgit()
{

    PROMPT_COMMAND=_load
    case $TERM in
#        *term | rxvt*  )
        *)
            if [[ ${EUID} == 0 ]] ; then
                PS1="${BLEU}[\A-\#]${ROUGE}\u@\h ${BLEU}\w ${parse_git_branch}${PROMPT_SYMBOL} $NC"
            else
		PS1="${BLEU}[\$LOAD-\!]${VERT}\u@\h ${BLEU}\w${JAUNE}$(parse_git_branch) ${VERT}€ $NC"
            fi
            ;;
        linux )
            PS1="${HILIT}[\A - \$LOAD]$NC\n[\u@\h \#] \W > " ;;
        *off )
            PS1="[\A - \$LOAD]\n[\u@\h \#] \W > " ;;
    esac
}

# powerpromptgit     # This is the default prompt -- might be slow.
                # If too slow, use fastprompt instead. ...

#-------------------------------------------------------------
# Git prompt (using submodule)
#-------------------------------------------------------------
   # Set config variables first
   GIT_PROMPT_ONLY_IN_REPO=0

   # GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status
   # GIT_PROMPT_IGNORE_SUBMODULES=1 # uncomment to avoid searching for changed files in submodules
   # GIT_PROMPT_WITH_VIRTUAL_ENV=0 # uncomment to avoid setting virtual environment infos for node/python/conda environments

   # GIT_PROMPT_SHOW_UPSTREAM=1 # uncomment to show upstream tracking branch
   # GIT_PROMPT_SHOW_UNTRACKED_FILES=normal # can be no, normal or all; determines counting of untracked files

   # GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=0 # uncomment to avoid printing the number of changed files

   # GIT_PROMPT_STATUS_COMMAND=gitstatus_pre-1.7.10.sh # uncomment to support Git older than 1.7.10

   # GIT_PROMPT_START=...    # uncomment for custom prompt start sequence
   # GIT_PROMPT_END=...      # uncomment for custom prompt end sequence

   # as last entry source the gitprompt script
   # GIT_PROMPT_THEME=Custom # use custom theme specified in file GIT_PROMPT_THEME_FILE (default ~/.git-prompt-colors.sh)
   # GIT_PROMPT_THEME_FILE=~/.git-prompt-colors.sh
   GIT_PROMPT_THEME=Solarized # use theme optimized for solarized color scheme
source ~/.bash-git-prompt/gitprompt.sh


#-------------------------------------------------------------
# Directory bookmark
#-------------------------------------------------------------
function mark {
    Usage="Usage: mark word"
    case $# in
        1) export "$1=cd `pwd`" ;;
        *) echo "Arguments incorrects"
            echo $Usage ;;
    esac
}

function goto {
    Usage="Usage: goto word"
    case $# in
        1)  if env | grep "^$1=cd " > /dev/null ; then
                eval $"$1"
                #echo "New current directory is `pwd`"
            else
                echo $Usage
            fi ;;
        *)  echo "Arguments incorrects"
            echo  $Usage  ;;
    esac
}

