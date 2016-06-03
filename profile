if [ -n "$BASH_VERSION" ]; then
  if [ -f ~/.bashrc ]; then
    source ~/.bashrc
  fi
fi

if [ -d ~/bin ]; then
  PATH=$HOME/bin:$PATH
fi

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

export PATH=$PATH:/usr/local/share/npm/bin
export PATH=$PATH:$HOME/.rvm/bin
export PATH=$PATH:$HOME/.cargo/bin

export NVM_DIR=~/.nvm

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [ -f ~/.profile.local ]; then
  source ~/.profile.local
fi
