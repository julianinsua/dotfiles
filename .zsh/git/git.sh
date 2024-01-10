function get_status_details {
  STATUS="$(git status --porcelain=1 2> /dev/null | grep -ic $1)"

  printf "$STATUS"
}
 


# M = modified
# A = added
# D = deleted
# R = renamed
# U = updated but unmerged
# ? = untracked
# ! = ignored 

function get_status_prompt {
  PROMPT=""
  list=("^ M" "^ A" "^ D" "^ R" "^ U" "^?" "^!")
  for el in "${list[@]}"
  do
    character=${el: -1}
    ch=$(status_char_mapper $character)
    st=$(get_status_details $el)
      if [[ $st -ne 0 ]]; then printf "$ch$st "; else printf ""; fi
  done
  printf "$PROMPT"
}

function status_char_mapper {
case $1 in
    [mM])
        printf ""
        ;;
    [aA])
        printf ""
        ;;
    [dD])
        printf ""
        ;;
    [rR])
        printf ""
        ;;
    [uU])
        printf ""
        ;;
    "!")
        printf ""
        ;;
    *)
        printf "$1"
        ;;
esac
}

function parse_git_dirty {
  STATUS="$(git status 2> /dev/null)"
  if [[ $? -ne 0 ]]; then printf ""; return; else printf " ["; fi
  if echo "${STATUS}" | grep -c "renamed:"         &> /dev/null; then printf " >"; else printf ""; fi
  if echo "${STATUS}" | grep -c "branch is ahead:" &> /dev/null; then printf " !"; else printf ""; fi
  if echo "${STATUS}" | grep -c "new file::"       &> /dev/null; then printf " +"; else printf ""; fi
  if echo "${STATUS}" | grep -c "Untracked files:" &> /dev/null; then printf " ?"; else printf ""; fi
  if echo "${STATUS}" | grep -c "modified:"        &> /dev/null; then printf " *"; else printf ""; fi
  if echo "${STATUS}" | grep -c "deleted:"         &> /dev/null; then printf " -"; else printf ""; fi
  printf " ]"
}

parse_git_branch() {
  # Long form
  git rev-parse --abbrev-ref HEAD 2> /dev/null
 # Short form
  # git rev-parse --abbrev-ref HEAD 2> /dev/null | sed -e 's/.*\/\(.*\)/\1/'
}
