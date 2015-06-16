#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ "$(uname)" == "Darwin" ]; then
	alias mvim="/Applications/MacVim.app/contents/MacOS/MacVim"
	PATH=/usr/local/opt/vim/bin:$PATH

	##
	# Your previous /Users/jeremeyhustman/.bash_profile file was backed up as
	# /Users/jeremeyhustman/.bash_profile.macports-saved_2014-11-11_at_19:19:59
	##

	# MacPorts Installer addition on 2014-11-11_at_19:19:59: adding an
	# appropriate PATH variable for use with MacPorts.
	export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
	# Finished adapting your PATH environment variable for use with MacPorts.

	export PATH="/usr/local/sbin:$PATH:~/Downloads/apache-maven-3.3.3/bin"

	export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_05.jdk/Contents/Home"
	export PATH="/usr/local/sbin:$PATH"
	PHP_AUTOCONF="/usr/local/bin/autoconf"
	source ~/.bash_aliases
fi
export PATH=/usr/local/bin:$PATH
