# Clone dotfiles
mkdir ~/git
cd git
git clone https://github.com/Netetra/dotfiles.git
git clone https://github.com/romkatv/powerlevel10k.git powerlevel10k
cd ~

#Create SymbolicLink
ln -s ~/git/dotfiles/.zshrc ~/.zshrc
ln -s ~/git/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/git/dotfiles/.config ~/.config
ln -s ~/git/dotfiles/.sheldon ~/.sheldon
ln -s ~/git/dotfiles/.background ~/.background

# Rust Setup
echo "Installing Rust stable..."
rustup default stable > /dev/null
echo "Installing Rust tools... "
rustup component add clippy rls rust-analysis rust-src rust-docs rustfmt > /dev/null

# Install Sheldon
echo "Installing sheldon..."
sheldon init --shell zsh

# Install Alacritty
echo "Installing Alacritty..."
cargo install alacritty
mkdir ~/.alacritty-colorscheme
git clone https://github.com/eendroroy/alacritty-theme.git ~/.alacritty-colorscheme


