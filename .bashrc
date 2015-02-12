#
# ~/.bashrc
#
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
setxkbmap -option caps:escape
[[ $- = *i* ]] && source ~/Downloads/liquidprompt/liquidprompt
