#!/usr/bin/env bash
set -e

# 1. Command Line Tools
if ! xcode-select -p >/dev/null 2>&1; then
  xcode-select --install
  read -rp "Press Enter once the Command Line Tools finish installing... "
fi

# 2. Homebrew
if [ ! -x /opt/homebrew/bin/brew ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# 3. Git config (log in to GitHub in Safari now: Settings > Emails for your no-reply address)
read -rp "Git name: " GIT_NAME
read -rp "Git email (your GitHub no-reply address): " GIT_EMAIL
git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"
git config --global init.defaultBranch main
echo .DS_Store >> ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

# 4. SSH key
if [ ! -f ~/.ssh/id_ed25519.pub ]; then
  ssh-keygen -t ed25519
fi
pbcopy < ~/.ssh/id_ed25519.pub
echo "Public key copied to clipboard."
echo "GitHub > Settings > SSH and GPG keys > New SSH key > paste > Add."
read -rp "Press Enter when done... "
ssh -T git@github.com || true

# 5. Packages
brew tap anomalyco/tap
brew tap oven-sh/bun

for f in anomalyco/tap/opencode-v2 oven-sh/bun/bun bat fastfetch fd fzf git mole neovim node \
         ripgrep starship stow tmux tree-sitter-cli uv xcodegen zoxide \
         zsh-autosuggestions zsh-syntax-highlighting; do
  brew install "$f" || echo "FAILED: $f"
done

for c in ogdesign-eagle bitwarden iina mac-mouse-fix ghostty zed arc thebrowsercompany-dia \
         helium-browser spotify discord keka; do
  brew install --cask "$c" || echo "FAILED: $c"
done

# 6. Clone dotfiles
read -rp "GitHub username: " GH_USER
read -rp "Dotfiles repo name: " REPO
mkdir -p ~/Developer/repos
git clone "git@github.com:$GH_USER/$REPO.git" ~/Developer/repos/"$REPO"

# 7. Stow
mkdir -p ~/.config ~/.local/bin
for f in .zshrc .zprofile; do
  [ -f ~/"$f" ] && [ ! -L ~/"$f" ] && mv ~/"$f" ~/"$f".bak
done
cd ~/Developer/repos/"$REPO"
stow -t ~ --no-folding zsh ghostty nvim starship scripts

echo "Done. Open a new terminal."
