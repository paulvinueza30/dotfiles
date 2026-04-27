# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Use Starship prompt (loaded after OMZ plugins)
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zoxide
  you-should-use
)


source $ZSH/oh-my-zsh.sh
source ~/.config/zsh/aliases.zsh

# Lazy-load NVM (only when 'nvm' or 'npm' is used)
export NVM_DIR="$HOME/.nvm"
load_nvm() {
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}
nvm() { unset -f nvm; load_nvm; nvm "$@"; }
npm() { unset -f npm; load_nvm; npm "$@"; }
node() { unset -f node; load_nvm; node "$@"; }

# Lazy-load thefuck (on-demand only)
thefuck-fix() {
  unfunction thefuck-fix
  eval "$(thefuck --alias-fix 2>/dev/null || true)"
  thefuck "$@"
}
alias fuck='thefuck-fix'

# Atuin - manual sync only (don't block startup)
export ATUIN_SESSION_MANUAL=1
# Lazy-load Atuin shell integration (runs on first prompt)
_atuin_load() {
  . "$HOME/.atuin/bin/env" 2>/dev/null
  eval "$(atuin init zsh)" 2>/dev/null
  precmd_functions=(${precmd_functions:#_atuin_load})
}
precmd_functions+=(_atuin_load)

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Starship prompt - use narrow config when terminal is small
if (( ${COLUMNS:-80} < 90 )); then
  export STARSHIP_CONFIG=~/dotfiles/starship/.config/starship-narrow.toml
else
  export STARSHIP_CONFIG=~/.config/starship.toml
fi
eval "$(starship init zsh)"

# Refresh prompt on terminal resize
TRAPWINCH() {
  if (( ${COLUMNS:-80} < 90 )); then
    export STARSHIP_CONFIG=~/dotfiles/starship/.config/starship-narrow.toml
  else
    export STARSHIP_CONFIG=~/.config/starship.toml
  fi
  zle && zle .reset-prompt
}

export PATH="$HOME/.local/bin:$PATH"
export PATH="/home/paulmv/.local/share/gem/ruby/3.4.0/bin:$PATH"

bindkey -v
export KEYTIMEOUT=1
bindkey -M viins 'jj' vi-cmd-mode
export PATH="$(go env GOBIN):$PATH"
export PATH="/home/paulmv/go/bin:$PATH"

export FUNCNEST=999

export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/4.0.0/bin:$PATH"
export GEM_HOME="$HOME/.local/share/gem"
export PATH="$PATH:$GEM_HOME/bin"
