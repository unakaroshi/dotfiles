#!/bin/bash

#-------------------
# Personnal Aliases
#-------------------
# aliases...
alias firefox='iceweasel'
alias top='settitle "Processes on $HOST" && top; cd $PWD'
alias cal='cal'
alias rm='rm -i'
alias pine='alpine'
alias cp='cp -i'
alias mv='mv -i'
alias pd='pushd .'
alias mount='mount | column -t'
alias h='history'
alias which='type -all'
alias ..='cd ..'
alias path='echo -e ${PATH//:/\\n}'
alias du='du -h'
alias df='df -hT'
alias df='df -kh'
alias vim='vim -X'
alias grep='grep --color'
alias figlet='figlet -d /usr/local/bin/fonts/'

# The 'ls' family (this assumes you use the GNU ls)
alias ls='ls -hF --color'	# add colors for filetype recognition
alias lx='ls -lXB'		# sort by extension
alias lk='ls -lSr'		# sort by size
alias la='ls -Al'		# show hidden files
alias lr='ls -lR'		# recursice ls
alias lt='ls -ltr'		# sort by date
alias lm='ls -al |more'		# pipe through 'more'
alias tree='tree -Cs'		# nice alternative to 'ls'

alias +='pushd .'
alias _='popd'


# tailoring 'less'
alias more='less'

alias date_iso_8601='date --iso-8601="seconds"'
alias week='date +%V'
alias timer='echo "Timer started. Stop with CTRL-D." && date && time cat && date'
alias mkdd='mkdir $(date +%Y-%m-%d)'
alias bell='tput bel'
alias reload='exec $SHELL -l'


