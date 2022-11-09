# Rust Setup
echo "Installing Rust stable..."
rustup default stable > /dev/null
echo "Installing Rust tools... "
rustup component add clippy rls rust-analysis rust-src rust-docs rustfmt > /dev/null

# Install Sheldon
echo "Installing sheldon..."
cargo install sheldon > /dev/null
sheldon init --shell zsh
eval "$(sheldon source)"

# Install Alacritty
cargo install alacritty
mkdir ~/.alacritty-colorscheme
git clone https://github.com/eendroroy/alacritty-theme.git ~/.alacritty-colorscheme

# Clone dotfiles
mkdir ~/git
cd git
git clone https://github.com/Netetra/dotfiles.git
cd ~

#Create SymbolicLink
ln -s ~/git/dotfiles/.zshrc ~/.zshrc
ln -s ~/git/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/git/dotfiles/.config ~/.config
ln -s ~/git/dotfiles/.sheldon ~/.sheldon
ln -s ~/git/dotfiles/.background ~/.background
ln -s ~/.cargo/bin/alacritty /usr/local/bin/alacritty
