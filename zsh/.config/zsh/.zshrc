# oh-my-zsh
export ZSH="$ZDOTDIR/ohmyzsh"
if [ ! -f $ZSH/oh-my-zsh.sh ]; then
  rm -rf $ZSH
  echo "Installing oh-my-zsh..."
  curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh
  mv ~/.config/zsh/.zshrc.pre-oh-my-zsh ~/.config/zsh/.zshrc
fi

ZSH_THEME="robbyrussell"
plugins=(
  fancy-ctrl-z
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

# Exports
export PATH="$HOME/.local/bin:/opt/local/bin:${PATH}"
export EDITOR=nvim

# Aliases
alias v=nvim
alias vi=nvim
alias vim=nvim
alias ls="gls --color"
alias sed=gsed
alias find=gfind
alias tree="tree --gitignore"

# XDG spec
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"

export AWS_CONFIG_FILE="${XDG_CONFIG_HOME}/aws/config"
export AWS_SHARED_CREDENTIALS_FILE="${XDG_CONFIG_HOME}/aws/credentials"
export DOCKER_CONFIG="${XDG_CONFIG_HOME}/docker"
export GOPATH="${XDG_DATA_HOME}/go"
export HISTFILE="${XDG_CACHE_HOME}/zsh/history"
export LESSHISTFILE="${XDG_CACHE_HOME}/less/history"
export PSQL_HISTORY="${XDG_CACHE_HOME}/psql/history"
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"

[ -s $ZDOTDIR/.zshrc.work ] && source $ZDOTDIR/.zshrc.work
