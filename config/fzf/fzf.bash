# Setup fzf
# ---------
if [[ ! "$PATH" == */home/nachoaz/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/nachoaz/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/nachoaz/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/nachoaz/.fzf/shell/key-bindings.bash"
