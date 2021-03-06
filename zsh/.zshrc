# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
#   ZSH Configuration
#

# Load configs
for config (~/.zsh/*.zsh) source $config

# Set History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

zstyle :compinstall filename '~/.zshrc'


# Completion
autoload -Uz compinit promptint
zstyle ':completion:*' menu select

prompt powerlevel10k


# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

#Completion for poetry
#
fpath+=~/.zfunc
zmodload zsh/complist
compinit

# Include hidden files in completion
_comp_options+=(globdots) 


# Vim Mode
bindkey -v
export KEYTIMEOUT=1

#Fix backspace bug when switching modes
bindkey "^?" backward-delete-char

# Use vim keys in tab completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'left' vi-backward-char
bindkey -M menuselect 'down' vi-down-line-or-history
bindkey -M menuselect 'up' vi-up-line-or-history
bindkey -M menuselect 'right' vi-forward-char


# Control bindings for programs
bindkey -s "^g" "lc\n"

# Load zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# Suggest aliases for commands
source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
