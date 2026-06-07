if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ -d "$HOME/paulv30/conf" ]]; then
    export MY_BASE="$HOME/paulv30/conf"
    export ZSH="$MY_BASE/.oh-my-zsh"
else
    export MY_BASE="$HOME/paulv30/zsh"
    export ZSH="$HOME/paulv30/.oh-my-zsh"
fi


ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zoxide
  thefuck
  timer
  web-search
  zsh-bat
  you-should-use
)

# Set this to true to ignore the "Insecure Completion" errors in Docker
ZSH_DISABLE_COMPFIX="true"

source $ZSH/oh-my-zsh.sh

# Dynamic path for aliases.zsh
source "$MY_BASE/.config/zsh/aliases.zsh"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="$HOME/.local/bin:$PATH"
