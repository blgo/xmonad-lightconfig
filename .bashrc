alias skype_latency='export PULSE_LATENCY_MSEC=60; skype'
alias sshfast='ssh -C4c arcfour,blowfish-cbc'
alias sshfastX='ssh -XC4c arcfour,blowfish-cbc'
alias python=python2.7
export PYTHONPATH=/usr/lib/python2.7/site-packages
clear
#PS1='[\u@\h \W]\$ '  # To leave the default one
#DO NOT USE RAW ESCAPES, USE TPUT
reset=$(tput sgr0)
red=$(tput setaf 1)
blue=$(tput setaf 4)
white=$(tput setaf 2)
PS1="\[\033[01;37m\]\$? \$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\]\342\234\223\"; else echo \"\[\033[01;31m\]\342\234\227\"; fi) $(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;32m\]\u@\h'; fi)\[\033[01;34m\] \w \$\[\033[00m\] "
 bind '"\e[A": history-search-backward'
 bind '"\e[B": history-search-forward'
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
shopt -s autocd
alias untar='tar -zxvf'
alias urxvt='urxvt -rv'
