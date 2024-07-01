HISTFILE=~/.config/zsh/.histfile
HISTSIZE=10000
SAVEHIST=5000

# Global history
setopt inc_append_history
setopt share_history

# Remove beep
unsetopt beep

# Use Vi mode
# bindkey -v
# export KEYTIMEOUT=1

# ENV
source $ZDOTDIR/.zshenv

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Basic auto/tab complete:
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi
# autoload -U compinit
# zstyle ':completion:*' menu select
# zmodload zsh/complist
# compinit
# _comp_options+=(globdots)		# Include hidden files.

# Source aliases
source $ZDOTDIR/zsh-aliases

# Source commands
source $ZDOTDIR/zsh-cmds

# Source work config
source $ZDOTDIR/zsh-work

# Source python configs 
source $ZDOTDIR/zsh-py

# NVM (LAGS TERMINAL)
# source /usr/share/nvm/init-nvm.sh
#source $HOME/.nvm/init-nvm.sh

# Source plugins
source $(brew --prefix)/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Completions
source <(kubectl completion zsh)
source <(helm completion zsh)
source <(docker completion zsh)
source <(tctl completion zsh)
source <(gh copilot completion zsh)

# Zsh Vim Mode
ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLOCK
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE

# Prompt
eval "$(starship init zsh)"
SPACESHIP_PROMPT_ASYNC=FALSE
