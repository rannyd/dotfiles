# Oh My Zsh Settings
export ZSH="$HOME/.oh-my-zsh" # Path to OMZ config
zstyle ':omz:update' mode reminder  # Update behavior - inform when available

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    vscode)

ZSH_AUTOSUGGEST_STRATEGY=(
    history
    completion
)

source $ZSH/oh-my-zsh.sh

# Enable Pure
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure

# Functions
newprj () {
    # Create a new directory and open it in VSCode
    # Requires "vsc" alias from oh-my-zsh vscode plugin
    if [ -z "$1" ]; then
        echo "Usage: newprj <project_name>"
        return 1
    fi
    
    mkdir -p "$1" && vsc "$1"
    }

# Get environmental variables from ~/.env_vars if it exists (separate work-related variables)
if [ -f ~/.env_vars ]; then
    source ~/.env_vars
fi

# Aliases
alias zshconf="code ~/.zshrc" # Requires VSCode "code" command
alias zshsrc="source ~/.zshrc"
alias python="python3"