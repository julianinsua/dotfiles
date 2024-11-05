# VARIABLES
# Manage History
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export SAVEHIST=1000000000
export HISTFILE=~/.zsh_history

setopt EXTENDED_HISTORY # Add timestamp to history
export HISTTIMEFORMAT="[%F %T] "
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY

# following should be turned off, if sharing history via setopt SHARE_HISTORY
# setopt INC_APPEND_HISTORY


setopt autocd

export BROWSER="firefox"
if [[ -n $SSH_CONNECTION ]]; then # Preferred editor for local and remote sessions
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
export VISUAL='nvim'
precmd() { print "" }

fpath+=~/.zfunc
autoload -Uz compinit
setopt PROMPT_SUBST
compinit
zstyle ':completion:*' menu select
# style completion selection
# zstyle ":completion:*:default" list-colors ${(s.:.)LS_COLORS} "ma=48;5;153;1"
zstyle ":completion:*:default" list-colors ${(s.:.)LS_COLORS}

# ALIASES
alias vim="nvim"
alias nv="nvim"
alias ls="eza --color=always --classify --icons --git --no-filesize --no-time --no-user --no-permissions --long"
alias lsa="eza --color=always --classify --icons --git -lha"
alias cat="bat"
alias lock="swaylock"
alias icat='kitten icat'

# PATH
export PATH=$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
export PATH=$HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
export PATH=$HOME/.config/tmux/plugins/tmuxifier/bin:$PATH

# Exporting go root dir and delve to path
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:$PATH

# EXTENSIONS
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.zsh/timer/timer.zsh
source ~/.zsh/fzf-git.sh/fzf-git.sh
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=green,fg=black,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=black,bold'
# TOOLS
source ~/.zsh/git/git.sh
# --> FZF
eval "$(fzf --zsh)"

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# Override fzf default `find` command with the faster `fd`
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd_prefix --exclude .git"

# Override the `**` on files shorthand to use `fd`
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Override the `**` on files shorthand to use `fd`
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --icons --color=always {} | head -200'"

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)             fzf --preview 'eza --tree --icons --color=always {} | head -200' "$@" ;;
    export|unset)   fzf --preview "eval 'echo \$' {}" "$@" ;;
    ssh)            fzf --preview 'dig {}' "$@" ;;
    icat)           fzf --preview 'kitten icat --align left {}' "$@" ;;
    *)              fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

# Set up bat to use catpuccin mocha theme to highlight
export BAT_THEME="Catppuccin Mocha"

# --> Tmuxifier
eval "$(tmuxifier init -)"

# --> Zoxide
eval "$(zoxide init zsh)"

PROMPT=$'%B%F{blue}  %F{#cba6f7}%~ %F{#6c7086}$(parse_git_branch) $(get_status_prompt) %b \n %F{yellow}%F{white} '
RPROMPT=''

source /usr/share/nvm/init-nvm.sh

# React native variables
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Created by `pipx` on 2024-07-17 08:36:34
export PATH="$PATH:/home/julian/.local/bin"
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
