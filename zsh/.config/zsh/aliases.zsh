alias ref='source ~/.zshrc'
alias ed='nvim ~/.config/zsh/aliases.zsh'

export GEM_HOME="$(gem env user_gemhome)"
export PATH="$PATH:$GEM_HOME/bin"

alias l='colorls -A --sd'
alias ll='colorls -lA --sd'
alias c='clear'
alias gamma='hyprctl hyprsunset gamma'
alias root='ssh -i ~/.ssh/id_homelab root@10.0.0.72'
alias head='ssh -i ~/.ssh/id_homelab head@10.0.0.110'
alias worker-1='ssh -i ~/.ssh/id_homelab worker-1@10.0.0.234'
alias worker-2='ssh -i ~/.ssh/id_homelab worker-2@10.0.0.224'
