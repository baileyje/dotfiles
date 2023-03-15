# My Dot Files
A set of portable (hopefully) configuration files to reduce setup time and consistency for new development environments

## Prerequisites

### MacOS
``` bash
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install fd fzf git jenv lazygit pyenv ripgrep starship zoxide
brew install --HEAD neovim
brew install --cask alacritty brave-browser kitty postman vscodium
brew tap homebrew/cask-fonts && brew install --cask font-meslo-lg-nerd-font
```

### Arch
``` bash
paru -S alacritty kitty fd fzf jenv lazygit pyenv ripgrep zoxide neovim-nightly tty-meslo-nerd zsh
```

## Cloning Configuration
``` bash
pushd ~ > /dev/null
git clone --bare --recurse-submodules -j8 https://github.com/bitbutcher/dotfiles dotfiles
git --git-dir=./dotfiles --work-tree=. checkout master .
touch .gitconfig
popd > /dev/null
```

### Universal (in a new zsh shell)
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
```

## Updating Configuration
``` bash
dots fetch origin master:master
```
