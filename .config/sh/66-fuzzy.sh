# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  if [[ -d "/usr/local/opt/fzf/bin" ]]; then
    PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
  fi
fi
