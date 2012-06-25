# system-wide environment settings for zsh(1)
if [ -x /usr/libexec/path_helper ]; then
  eval `/usr/libexec/path_helper -s`
fi

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
export ZSH_THEME="thejspr"

# OFF
# zsh-syntax-highlighting gem osx
plugins=(git bundler brew history-substring-search gem osx)

source $ZSH/oh-my-zsh.sh

if [ -f ~/Code/dotfiles/_zshrc ]; then
  . ~/Code/dotfiles/_zshrc
fi

# Rbenv
if [[ -s "${HOME}/.rbenv/bin" ]]; then
  rbenv_root="${HOME}/.rbenv"
else
  rbenv_root="/usr/local/rbenv"
  export RBENV_ROOT="$rbenv_root"
fi

export PATH=/usr/local/bin:~/bin:/Library/PostgreSQL/9.1/bin:${rbenv_root}/bin:$PATH
eval "$(rbenv init - --no-rehash)"

unalias ruby
# [[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc
