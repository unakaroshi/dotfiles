#===============================================================
#

# PERSONAL $HOME/.bashrc FILE for bash-2.05 (or later)
#
# This file is read (normally) by interactive shells only.
# Here is the place to define your aliases, functions and
# other interactive features like your prompt.
#
# This file was designed (originally) for Solaris.
# --> Modified for Linux.
# This bashrc file is a bit overcrowded - remember it is just
# just an example. Tailor it to your needs
#
#===============================================================

# --> Comments added by HOWTO author.

#-----------------------------------
# Source global definitions (if any)
#-----------------------------------

for file in /etc/{bash.bashrc,bash_completion}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

for file in ~/.{bash_aliases,bash_functions,bash_completion,dircolors.sh,git-prompt}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file


# Define some colors first:
BLACK='\033[0;30m'
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
PURPLE='\033[0;35m'
WHITE='\033[1;37m'
GRAY='\033[0;37m'
DARKGRAY='\033[1;30m'
NC='\033[0m'              # No Color

#-------------------------------------------------------------
# Automatic setting of $DISPLAY (if not set already)
# This works for linux and solaris - your mileage may vary....
#-------------------------------------------------------------
if test -z "$DISPLAY" -a "$TERM" = "xterm" -a -x /usr/bin/who ; then
  WHOAMI="`/usr/bin/who am i`"
  _DISPLAY="`expr "#WHOAMI" : '.*(\([^\.][^\.]*\).*)'`:0.0"
  if [ "${_DISPLAY}" != ":0:0.0" -a "${_DISPLAY}" != " :0.0" \
    -a "${_DISPLAY}" != ":0.0" ]; then
    export DISPLAY="${_DISPLAY}";
  fi
  unset WHOAMI _DISPLAY
fi

#---------------
# Some settings
#---------------

#set -o vi
set -o notify
set -o noclobber
set -o ignoreeof
#set -o nounset
##set -o xtrace          # useful for debuging
#
shopt -s cdspell
shopt -s cdable_vars
shopt -s cmdhist
shopt -s checkhash
shopt -s checkwinsize
shopt -s mailwarn
shopt -s sourcepath
shopt -s no_empty_cmd_completion
shopt -s histappend histreedit
shopt -s extglob        # useful for programmable completion
ulimit -c 8192

trap _exit 0

umask 022

#
# Global Setting


# If set to a value greater then zero, the value is interpreted
# as the number of seconds to wait for input after issuing
# the primary prompt. If no input arrives in that time, bash
# quits itself
export TMOUT=0
export EDITOR=vim
export FIGNORE=.bak:.o:~
export TERM=xterm-color
export LESSCHARSET='latin1'
export LESSOPEN='|/usr/bin/lesspipe.sh %s 2>&-' # Use this if lesspipe.sh exists

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1

export HISTSIZE=5000
export HISTFILESIZE=5000
export HISTIGNORE='&:[ ]*' # omit dups & lines starting with space

export QTDIR=/opt/Qt5.2.0/5.2.0/gcc
export ANDROID_NDK_HOME=/opt/android-ndk-r9c
export JAVA_HOME=/opt/jdk1.7.0.45
export ANDROIDSDK=$HOME/android-sdk-linux
export PATH=$PATH:$HOME/bin:$QTDIR/bin:$ANDROIDSDK/tools:$ANDROIDSDK/platform-tools
export CALIBRE_DEVELOP_FROM=$HOME/src/calibre/src


gitprompt

