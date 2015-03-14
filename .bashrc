#!/bin/bash
# ~/.bashrc
#
if [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "msys" ]]; then
else
	PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH:/opt/android-sdk/platform-tools:/opt/android-sdk/tools/"
	setxkbmap -option caps:escape
	[[ $- = *i* ]] && source ~/Downloads/liquidprompt/liquidprompt
fi
