function prodtab() {
  NAME=$1; if [ -z "$NAME" ]; then NAME="Default"; fi 
  echo -e "\033]50;SetProfile=$NAME\a"
  echo -e "\033]6;1;bg;red;brightness;255\a"
}

function tab-reset() {
    NAME="Default"
    echo -e "\033]6;1;bg;*;default\a"    
    echo -e "\033]50;SetProfile=$NAME\a"
    # export DISABLE_AUTO_TITLE="false"
}

function prodsafeheroku() {
    if [[ -n "$ITERM_SESSION_ID" ]]; then
        trap "tab-reset" INT EXIT
        if [[ "$*" =~ ".*prod.*" ]]; then
            prodtab prodsafe
        fi
        # DISABLE_AUTO_TITLE="false"
        # echo -ne "\033]0;heroku "$*"\007"
    fi
    heroku $*
}
compdef _heroku prodtab=heroku

alias heroku="prodsafeheroku"
