bindkey -e

# Prompt
autoload -U colors && colors
autoload -U vcs_info
precmd() { vcs_info }
setopt prompt_subst
PS1='%~ %{$fg[magenta]%}${vcs_info_msg_0_}%{$reset_color%}$ '
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git:*' formats '(%b%u%c) '
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c) '

# Completion
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# History
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_IGNORE_ALL_DUPS SHARE_HISTORY

# Aliases
alias v=nvim
alias vi=nvim
alias vim=nvim
alias ls="ls --color"
alias bbic="brew update &&\
  brew bundle install --cleanup --file=~/.config/Brewfile &&\
  brew upgrade"

eval "$(/opt/homebrew/bin/brew shellenv)"
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(direnv hook zsh)"
source <(fzf --zsh)

eval "$(mise activate zsh)"

# Work stuff
[ -s $ZDOTDIR/.zshrc.work ] && source $ZDOTDIR/.zshrc.work
