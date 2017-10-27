#!/bin/bash
# ~/.bashrc
#
#[ -n "$PS1" ] && source ~/.bash_profile;

PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h: \[\e[33m\]\w\[\e[0m\]\n\$ '

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [[ "$(uname)" == "Darwin" ]]; then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
  alias lnpm='lnpm.sh'
  alias grep='grep -norw --color=auto'
  alias lg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
fi

if [[ $OSTYPE != "cygwin" ]] || [[ $OSTYPE != "msys" ]]; then
  export M2_HOME="/opt/maven"
  export PATH="$M2_HOME:$PATH:/opt/android-sdk/platform-tools:/opt/android-sdk/tools"
  export CHROME_BIN="/bin/chromium"
  #setxkbmap -option caps:escape

  PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

  pacman-size()
  {
    CMD="pacman -Si"
    SEP=": "
    TOTAL_SIZE=0

    RESULT=$(eval "${CMD} $@ 2>/dev/null" | awk -F "$SEP" -v filter="Size" -v pkg="^Name" \
      '$0 ~ pkg {pkgname=$2} $0 ~ filter {gsub(/\..*/,"") ; printf("%6s KiB %s\n", $2, pkgname)}' | sort -u -k3)

    echo "$RESULT"

    ## Print total size.
    echo "$RESULT" | awk '{TOTAL=$1+TOTAL} END {printf("Total : %d KiB\n",TOTAL)}'
  }
fi

if [[ "$(uname)" == "Linux" ]]; then
  alias http='cd /srv/http'
  alias eta='cd /srv/http/eta'
  export LNPMDIR="/src/node_modules/"
fi

if [[ "$(uname)" == "SunOS" ]]; then
  alias cmsdocs='cd /opt/oracle/webserver7/https-dotcmsdev.dot.soa.alaska.gov/docs/web'
fi
