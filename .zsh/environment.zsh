typeset -U PATH path
path=("$HOME/bin" "/usr/bin" "/home/jason/.local/share/gem/ruby/3.0.0/bin" "/home/jason/.local/bin" "$path[@]")
export PATH

# Default Programs
export EDITOR="nvim"
export READER="zathura"
export TERMINAL="kitty"
export BROWSER="qutebrowser"

# Configs
export GNUPGHOME=$HOME/.config/gpg/
export BAT_THEME="base16"
export LC_CTYPE=en_US.UTF-8
export GPG_TTY=${TTY}                   # Allows GPG to run in tmux

# Shortcut Alias
export FZF_ALT_C_COMMAND="fd -t d . $HOME"
export vimconfig=$HOME/.config/nvim/init.lua

# Wayland Specific Options
export MOZ_ENABLE_WAYLAND=1 firefox


