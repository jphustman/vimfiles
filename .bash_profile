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

  # MacPorts Installer addition on 2016-12-11_at_16:18:58: adding an appropriate PATH variable for use with MacPorts.
  export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
  # Finished adapting your PATH environment variable for use with MacPorts.

  # Setting PATH for Python 2.7
  # The original version is saved in .bash_profile.pysave
  PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
  export PATH
fi

if [ "$(uname)" == "Linux" ]; then
  export PATH="$HOME/.node_modules/bin:$PATH"

  export CHROME_BIN='/usr/bin/chromium'

  export SVN_EDITOR='vim'
fi

if [ "$(uname)" == "SunOS" ]; then
  export RUBY_BIN=/usr/ruby/2.1/bin
  export DRUPAL=/opt/oracle/webserver7/https-dotcmsdev.dot.soa.alaska.gov/docs/vendor/bin
  export PATH=$DRUPAL:$RUBY:/usr/local/bin:/usr/bin:/usr/sbin
fi

#common aliases
alias gs='git status'
alias gf='git fetch'
alias gp='git pull'




