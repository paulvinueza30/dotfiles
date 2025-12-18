alias ref='source ~/.zshrc'
alias ed='nvim ~/.config/zsh/aliases.zsh'

export GEM_HOME="$(gem env user_gemhome)"
export PATH="$PATH:$GEM_HOME/bin"

alias l='colorls -A --sd'
alias ll='colorls -lA --sd'
alias c='clear'
alias gamma='hyprctl hyprsunset gamma'
