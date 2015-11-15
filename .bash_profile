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

	export CHROME_BIN="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"


	alias cdjthcc='cd ~/Documents/lucee-4.5.1.022-express/webapps/juneauthcc/jthcc/includes/themes/juneauthcc'

	export PATH="$HOME/.node/bin:$PATH"

	# nvm
	export NVM_DIR=~/.nvm
	source $(brew --prefix nvm)/nvm.sh

	# rbenv
	export RBENV_ROOT=/usr/local/var/rbenv
	if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

	export PATH="$HOME/.rbenv/versions/2.2.3/bin:$PATH"
	eval "$(rbenv init -)"

	export HOMEBREW_GITHUB_API_TOKEN='7257fd7410cc14659be3c8f4a49635607bbf21cc'

	export ECLIPSE_HOME='/opt/homebrew-cask/Caskroom/eclipse-jee/4.5/Eclipse.app/Contents/Eclipse'

	alias eclimd='$ECLIPSE_HOME/eclimd'
fi

if [ "$(uname)" == "Linux" ]; then
	export PATH="$PATH:/home/jphustman/lnpm.sh"
fi
export PATH="/usr/local/bin:$PATH"

##
# Your previous /Users/Jeremey/.bash_profile file was backed up as /Users/Jeremey/.bash_profile.macports-saved_2015-11-14_at_13:40:04
##

# MacPorts Installer addition on 2015-11-14_at_13:40:04: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

