#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

alias ls='ls --color=auto'
# A green/blue prompt for regular users:
#PS1='[\u@\h \W]\$ '  # Default
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[0;37m\]'
