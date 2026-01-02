# Starship
eval "$(starship init zsh)"

# Activate plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh # zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-z/zsh-z.plugin.zsh # zsh-z

# Disable underline
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# zsh-z config
zstyle ':completion:*' menu select

# Aliases
alias ls="exa --icons"
