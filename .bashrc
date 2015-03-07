#
# ~/.bashrc
#
#[ -n "$PS1" ] && source ~/.bash_profile;
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
[[ $- = *i* ]] && source ~/Downloads/liquidprompt/liquidprompt;
