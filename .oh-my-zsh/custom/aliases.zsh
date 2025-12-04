alias ref='source ~/.zshrc'
alias ed='nvim $ZSH_CUSTOM/aliases.zsh'

export GEM_HOME="$(gem env user_gemhome)"
export PATH="$PATH:$GEM_HOME/bin"

alias l='colorls -A --sd'
alias ll='colorls -lA --sd'
alias c='clear'
