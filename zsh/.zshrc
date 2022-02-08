bindkey -e

autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{A-Za-z}={a-zA-z}' '+l:|=* r:|=*'
compinit

function source_if() {
  [ -f "$1" ] && source "$1"
}

source_if "$(brew --prefix zsh-autosuggestions)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source_if "$(brew --prefix zsh-syntax-highlighting)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source_if "$HOME/.zshrc.work"

export EDITOR=nvim
export PATH=$PATH:$HOME/.bin
export HOMEBREW_NO_ENV_HINTS=1

alias vim='nvim'
alias vi='nvim'
alias v='nvim'
alias ls='ls -G'

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{red}●%f'
zstyle ':vcs_info:*' stagedstr '%F{yellow}●%f'
zstyle ':vcs_info:git:*' formats " [%F{green}%b%f %u%c]"
setopt prompt_subst
prompt='%F{blue}%~%f${vcs_info_msg_0_} %% '
