autoload -Uz compinit && compinit

# Source functions and aliases
source ~/dev/dotfiles/.zsh_aliases
source ~/dev/dotfiles/.zsh_functions
source ~/dev/dotfiles/init/__secrets.sh

# pass autocompletes
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit
  compinit
fi

# zoxide init
eval "$(zoxide init zsh)"

# NVM Configuration
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# bun completions
[ -s "/Users/jubby/.bun/_bun" ] && source "/Users/jubby/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

#rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# pnpm
export PNPM_HOME="/Users/jubby/Library/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac

# other shizz
export HOME_LOCAL="/Users/jubby/.local/bin"
case ":$PATH:" in
*":$*HOME_LOCAL*:"*) ;;
*) export PATH="$HOME_LOCAL:$PATH" ;;
esac

# dotnet lsp override for zed editor
export DOTNET_ROOT="$(dirname "$(which dotnet)")"

# others
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"
