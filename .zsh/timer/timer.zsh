function preexec() {
  timer=$(($(date +%s%0N)/1000000))
}

function precmd() {
  print ""
  if [ $timer ]; then
    now=$(($(date +%s%0N)/1000000))
    elapsed=$(($now-$timer))

    export RPROMPT="%K{#1e1e2e}%F{yellow}%f%k%K{yellow}%F{black}${elapsed}ms %k%{$reset_color%}"
    unset timer
  fi
}
