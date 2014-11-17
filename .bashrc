# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
get_dir() {
	printf "%s" $(pwd | sed "s:$HOME:~:")
}

get_sha() {
	git rev-parse --short HEAD 2>/dev/null
}
# GIT info in prompt
# be sure to create a symolic link to .git-prompt.sh in your home directory.
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
# Explicitly unset color (default anyhow). Use 1 to set it.
GIT_PS1_SHOWCOLORHINTS=
GIT_PS1_DESCRIBE_STYLE="branch"
GIT_PS1_SHOWUPSTREAM="auto git"

# A green/blue prompt for regular users:
#PS1='[\u@\h \W]\$ '  # Default
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\]$(__git_ps1 " [%s $(get_sha)] ")\[\e[1;32m\]\$\[\e[m\] \[\e[0;37m\]'


