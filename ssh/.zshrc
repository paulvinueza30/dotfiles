if [[ -d "$HOME/paulv30/conf" ]]; then
    export MY_BASE="$HOME/paulv30/conf"
    export ZSH="$MY_BASE/.oh-my-zsh"
    export ZSH_CUSTOM="$ZSH/custom"
else
    export MY_BASE="$HOME/paulv30/zsh"
    export ZSH="$HOME/paulv30/.oh-my-zsh"
    export ZSH_CUSTOM="/opt/oh-my-zsh-custom"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting zoxide thefuck timer web-search zsh-bat you-should-use)

ZSH_DISABLE_COMPFIX="true"
source "$ZSH/oh-my-zsh.sh"
source "$HOME/paulv30/zsh/.config/zsh/aliases.zsh"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zshxport PATH="$HOME/.local/bin:$PATH"
