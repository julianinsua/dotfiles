# VARIABLES
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export HISTFILE=~/.zsh_history

setopt HIST_FIND_NO_DUPS
# following should be turned off, if sharing history via setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt autocd

export BROWSER="firefox"
if [[ -n $SSH_CONNECTION ]]; then # Preferred editor for local and remote sessions
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
export VISUAL='nvim'
precmd() { print "" }

autoload -Uz compinit
setopt PROMPT_SUBST
compinit
zstyle ':completion:*' menu select

# ALIASES
alias vim="nvim"
alias nv="nvim"
alias ls="exa --classify --icons"
alias lsa="exa --classify --icons -lha"
alias lock="swaylock"
alias nvk='NVIM_APPNAME="nvim-kickstart" nvim'
alias nvim-kickstart='NVIM_APPNAME="nvim-kickstart" nvim'

# PATH
export PATH=$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
export PATH=$HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH

# Exporting go root dir and delve to path
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:$PATH

# EXTENSIONS
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.zsh/timer/timer.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=green,fg=black,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=black,bold'
# TOOLS
source ~/.zsh/git/git.sh

# Setting up zoxide
eval "$(zoxide init zsh)"

PROMPT=$'%B%F{blue}  %F{#cba6f7}%~ %F{#6c7086}$(parse_git_branch) $(get_status_prompt) %b \n %F{yellow}%F{white} '
RPROMPT=''


