# My Dot Files
A set of portable (hopefully) configuration files to reduce setup time and consistency for new development environments

## Prerequisites

### MacOS
``` bash
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install fd fzf git jenv jq lazygit pyenv ripgrep starship zoxide
brew install --HEAD neovim
brew install --cask alacritty brave-browser kitty postman vscodium
brew tap homebrew/cask-fonts && brew install --cask font-fira-code-nerd-font
```

### Arch
``` bash
# assumes chaotic AUR
pacman -S --needed alacritty kitty fd fzf jenv jq lazygit pyenv ripgrep zoxide neovim-nightly-bin ttf-firacode-nerd ttf-meslo-nerd ttf-inconsolata-go-nerd zsh postman code
```

## Cloning Configuration
``` bash
pushd ~ > /dev/null
git clone --bare --recurse-submodules -j8 https://github.com/bitbutcher/dotfiles dotfiles
git --git-dir=./dotfiles config --local --add remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
git --git-dir=./dotfiles --work-tree=. fetch origin
git --git-dir=./dotfiles --work-tree=. branch -u origin/master
git --git-dir=./dotfiles --work-tree=. checkout
git --git-dir=./dotfiles --work-tree=. submodule update --init --recursive
touch .gitconfig
popd > /dev/null
```

### Universal (!!! in a new zsh shell !!!)
``` bash
dots config --local status.showUntrackedFiles no
nvm install --lts
nvm use --lts
npm install -g npm@latest yarn typescript neovim
pyenv install 3.10
pyenv global 3.10
pip install --upgrade pip
pip install pynvim neovim
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup default stable
rustup component add rust-analyzer
code.ext.inst
```

## Updating Configuration
``` bash
dotsup
code.ext.up # optionally install/update all your vscode extensions
```
