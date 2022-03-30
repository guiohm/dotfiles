
# Enable custom pythonrc for autocomplete
# export PYTHONSTARTUP=$HOME/.pythonrc

# PATH="$PATH"

# WSL ssh keys handling
# requires keychain : sudo apt-get install keychain
/usr/bin/keychain --nogui $HOME/.ssh/id_rsa
source $HOME/.keychain/$HOSTNAME-sh

source ~/.aliases

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

