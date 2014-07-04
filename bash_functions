#!/bin/bash

function up()
{
  sudo apt-get update && sudo apt-get dist-upgrade
}

function gitdot()
{
 set -e

  echo "digraph lattice {"

  shape="shape=Mrecord, style=filled,"
  git rev-list --pretty=format:"%H %h|%an:%s" "$@" |
          sed "s/[\"\{\}()<>]/\\\\&/g" |
          sed -n "s/^\([0-9a-f]\{40\}\) \(.*\)$/n\1 [$shape label=\"{\2}\"]/p"

  git rev-list --parents "$@" |
          while read commit parents
          do
                  for p in $parents
                  do
                          echo "n$commit -> n$p"
                  done
          done

  echo "}"
}

# -------------------------------------------------------------------
# extract: extract of compressed-files
extract()
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
             *)           echo "'$1' cannot be extracted via >extract<" ;;
         esac
  else
    echo "'$1' is not a valid file"
  fi
}



function _exit()        # function to run upon exit of shell
{
    echo -e "${RED} Hasta la vista, baby ${NC}"
}

function fastprompt()
{
  PS1='\[\033[1;33m\] [\u@\h] \[\033[1;33m\]\W >\[\033[0m\] ' 
}

function gitprompt()
{
  PROMPT_COMMAND='__git_ps1 "\[\033[1;33m\]\n\u@\h:\w\n\[\033[0m\]" " > "'
  export PS2="> " # Continued prompt
  export PS3="Please make a choice: " # Select Prompt
  export PS4='+xtrace $LINENO: '  # debug prompt
}


function settitle()
{
  echo -ne "\e]2;$@\a\e]1;$@\a";
}

##################################################
# Fancy PWD display function
##################################################
# The home directory (HOME) is replaced with a ~
# The last pwdmaxlen characters of the PWD are displayed
# Leading partial directory names are striped off
# /home/me/stuff          -> ~/stuff               if USER=me
# /usr/share/big_dir_name -> ../share/big_dir_name if pwdmaxlen=20
##################################################
function cd()
{
  command cd "$@"

  settitle " ${USER}@${HOSTNAME}: ${PWD/$HOME/~} "
}


function xtitle ()
{
    case $TERM in
        *term | rxvt)
            echo -n -e "\033]0;$*\007" ;;
        *)  ;;
    esac
}


function ll()
{ 
  ls -l "$@"| egrep "^d" ; ls -lXB "$@" 2>&-| egrep -v "^d|insgesamt "; 
}

#-----------------------------------
# File & strings related functions:
#-----------------------------------

function ff() 
{ 
  find . -name '*'$1'*' ; 
}                 # find a file

function fe() 
{ 
  find . -name '*'$1'*' -exec $2 {} \; ; 
}  # find a file and run $2 on it 

function fstr() # find a string in a set of files
{
    if [ "$#" -lt 2 ]; then
        echo "Usage: fstr \"pattern\" [files] "
        return;
    fi
    SMSO=$(tput smso)
    RMSO=$(tput rmso)
    find . -type f -name "${2:-*}" -print | xargs grep -sin "$1" | \
sed "s/$1/$SMSO$1$RMSO/gI"
}

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

function swap()         # swap 2 filenames around
{
    local TMPFILE=tmp.$$
    mv $1 $TMPFILE
    mv $2 $1
    mv $TMPFILE $2
}

function ask()
{
    echo -n "$@" '[y/n] ' ; read ans
    case "$ans" in
        y*|Y*) return 0 ;;
        *) return 1 ;;
    esac
}


#-----------------------------------
# Process/system related functions:
#-----------------------------------

function my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,bsdtime,command ; }
function pp() { my_ps f | awk '!/awk/ && $0~var' var=${1:-".*"} ; }


# Misc utilities:

function repeat()       # repeat n times command
{
    local i max
    max=$1; shift;
    for ((i=1; i <= max ; i++)); do  # --> C-like syntax
        eval "$@";
    done
}

function cl()
{
  cd $HOME/src/ControllerLib/ARG_ControllerLib
  gvim +Project
}

function lister() 
{
  ls -l `if [ "$1" == '' ]; then echo '.'; else echo "$1"; fi` 2>/dev/null
}

function lsd()
{
  lister $1 | egrep '^d'
}

function lsf() 
{
  lister $1 | egrep -v '^d'
}

function ps_spot()
{
  ps auxww | grep $1 | grep -v grep
}

function printConfig()
{
  echo ""
  echo "Configuration: "
  echo "  DEV_ID            : $DEV_ID"
  echo "  CONTACTS_PATH     : $CONTACTS_PATH"
  echo "  LWDIR             : $LWDIR"
  echo "  CVSROOT           : $CVSROOT"
  echo "  QT_DEBUG_PLUGINS  : $QT_DEBUG_PLUGINS"
  echo ""
}
