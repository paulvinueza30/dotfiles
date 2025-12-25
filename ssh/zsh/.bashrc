CONF_DIR="$HOME/paulv30"

if [ -d "$CONF_DIR" ] && [ -n "$BASH_VERSION" ] && [ -z "$ZSH_VERSION" ]; then
  export ZDOTDIR="$CONF_DIR/conf/zsh"
  export PATH="$HOME/.local/bin:$PATH"
  exec zsh
  exit 0
fi

if [ -n "$BASH_VERSION" ] >/dev/null 2>&1; then
  if ! command -v zsh >/dev/null 2>&1; then
    sudo apt install zsh
  fi
  nvim_need_install=false
  if ! command -v nvim >/dev/null 2>&1; then
    nvim_need_install=true
  else
    nvim_version=$(nvim --version | head -n1 | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -n1)
    if [ -n "$nvim_version" ]; then
      required_version="0.11.5"
      if [ "$(printf '%s\n' "$required_version" "$nvim_version" | sort -V | head -n1)" != "$required_version" ]; then
        nvim_need_install=true
      fi
    fi
  fi

  if [ "$nvim_need_install" = true ]; then
    echo "Installing/upgrading neovim (>= 0.11.5)..."
    if command -v apt-get >/dev/null 2>&1; then
      sudo add-apt-repository -y ppa:neovim-ppa/unstable >/dev/null 2>&1
      sudo apt-get update -qq
      sudo apt-get install -y neovim-runtime neovim
    elif command -v yum >/dev/null 2>&1; then
      sudo yum install -y -q neovim
    elif command -v dnf >/dev/null 2>&1; then
      sudo dnf install -y -q neovim
    elif command -v pacman >/dev/null 2>&1; then
      sudo pacman -S --noconfirm neovim
    fi
  fi

  # --- Zoxide Logic ---
  if ! command -v zoxide >/dev/null 2>&1; then
    echo "Installing zoxide..."
    curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
  fi

  # --- TheFuck Logic  ---
  if ! command -v thefuck >/dev/null 2>&1; then
    echo "Installing thefuck..."
    if command -v apt-get >/dev/null 2>&1; then
      sudo apt-get update -qq
      sudo apt install -y pipx
      pipx install https://github.com/nvbn/thefuck/archive/master.zip
      pipx inject thefuck setuptools
    elif command -v pacman >/dev/null 2>&1; then
      sudo pacman -S --noconfirm thefuck
    elif command -v pip3 >/dev/null 2>&1; then
      # Fallback for systems that aren't PEP 668 restricted
      pip3 install --user thefuck || pip install --user thefuck
    fi
  fi

  # --- Ruby/Colorls Logic  ---
  if ! command -v gem >/dev/null 2>&1; then
    echo "Installing ruby (for gem)..."
    if command -v apt-get >/dev/null 2>&1; then
      sudo apt-get install -y -qq ruby-full
    elif command -v yum >/dev/null 2>&1; then
      sudo yum install -y -q ruby
    elif command -v dnf >/dev/null 2>&1; then
      sudo dnf install -y -q ruby
    elif command -v pacman >/dev/null 2>&1; then
      sudo pacman -S --noconfirm ruby
    fi
    gem install colorls
  fi

  # --- Path & Shell Configuration ---
  export ZDOTDIR="$HOME/paulv30/conf/zsh"
  ZSHRC_PATH="$ZDOTDIR/.zshrc"

  mkdir -p "$ZDOTDIR"
  touch "$ZSHRC_PATH"

  if ! grep -q ".local/bin" "$ZSHRC_PATH"; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >>"$ZSHRC_PATH"
  fi

  if ! grep -q "zoxide init zsh" "$ZSHRC_PATH"; then
    echo 'eval "$(zoxide init zsh)"' >>"$ZSHRC_PATH"
  fi

  if ! grep -q "thefuck --alias" "$ZSHRC_PATH"; then
    echo 'eval $(thefuck --alias)' >>"$ZSHRC_PATH"
  fi

  if ! grep -q "colorls" "$ZSHRC_PATH" && command -v colorls >/dev/null 2>&1; then
    echo 'alias lc="colorls"' >>"$ZSHRC_PATH"
  fi

  echo "Switching to Zsh..."
  exec zsh
fi
