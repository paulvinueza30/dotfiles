if [ -n "$BASH_VERSION" ] && [ -z "$ZSH_VERSION" ] && command -v zsh >/dev/null 2>&1; then
    nvim_need_install=false
    if ! command -v nvim >/dev/null 2>&1; then
        nvim_need_install=true
    else
        nvim_version=$(nvim --version | head -n1 | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -n1)
        if [ -n "$nvim_version" ]; then
            required_version="0.11.2"
            if [ "$(printf '%s\n' "$required_version" "$nvim_version" | sort -V | head -n1)" != "$required_version" ]; then
                nvim_need_install=true
            fi
        fi
    fi
    
    if [ "$nvim_need_install" = true ]; then
        echo "Installing/upgrading neovim (>= 0.11.2)..."
        if command -v apt-get >/dev/null 2>&1; then
            sudo add-apt-repository -y ppa:neovim-ppa/unstable >/dev/null 2>&1 || sudo add-apt-repository -y ppa:neovim-ppa/stable >/dev/null 2>&1
            sudo apt-get update -qq
            sudo apt-get install -y -qq neovim
        elif command -v yum >/dev/null 2>&1; then
            sudo yum install -y -q neovim
        elif command -v dnf >/dev/null 2>&1; then
            sudo dnf install -y -q neovim
        elif command -v pacman >/dev/null 2>&1; then
            sudo pacman -S --noconfirm neovim
        fi
    fi
    
    if ! command -v zoxide >/dev/null 2>&1; then
        echo "Installing zoxide..."
        if command -v apt-get >/dev/null 2>&1; then
            curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
        elif command -v yum >/dev/null 2>&1; then
            curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
        elif command -v dnf >/dev/null 2>&1; then
            curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
        elif command -v pacman >/dev/null 2>&1; then
            sudo pacman -S --noconfirm zoxide
        fi
    fi
    
    if ! command -v thefuck >/dev/null 2>&1; then
        echo "Installing thefuck..."
        if command -v pip3 >/dev/null 2>&1; then
            pip3 install --user thefuck
        elif command -v pip >/dev/null 2>&1; then
            pip install --user thefuck
        elif command -v apt-get >/dev/null 2>&1; then
            sudo apt-get install -y -qq python3-pip
            pip3 install --user thefuck
        elif command -v yum >/dev/null 2>&1; then
            sudo yum install -y -q python3-pip
            pip3 install --user thefuck
        elif command -v dnf >/dev/null 2>&1; then
            sudo dnf install -y -q python3-pip
            pip3 install --user thefuck
        elif command -v pacman >/dev/null 2>&1; then
            sudo pacman -S --noconfirm thefuck
        fi
    fi
    
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
    
    export ZDOTDIR="$HOME/paulv30/conf/zsh"
    exec zsh
fi
