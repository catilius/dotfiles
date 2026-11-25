eval "$(starship init zsh)"
export PATH=$PATH:$HOME/.spicetify

export PATH="$HOME/.bun/bin:$PATH"

export HISTSIZE=5000
export SAVEHIST=5000
export HISTFILE="${HOME}/.zsh_history"

setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# Fix for starship newline and clear cmd
precmd() { precmd() {echo ""} }
alias clear='printf "\n%.0s" {1..$(tput lines)} && tput cup 0 0 && precmd() { precmd() { echo "" } }'

# Enable Tab completion, including Homebrew completions.
_zsh_brew_prefix="$(brew --prefix)"
fpath=("$_zsh_brew_prefix/share/zsh/site-functions" $fpath)

autoload -Uz compinit
compinit

#completions style
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Suggest commands from history.
source "$_zsh_brew_prefix/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Disable underlining of paths.
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]='none'
ZSH_HIGHLIGHT_STYLES[path_prefix]='none'

# Keep syntax highlighting last.
source "$_zsh_brew_prefix/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
alias about='~/.local/bin/machine-report'
