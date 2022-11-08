# Install Sheldon
cargo install sheldon
sheldon init --shell zsh
eval "$(sheldon source)"

# Install Alacritty
cargo install alacritty
git clone https://github.com/eendroroy/alacritty-theme.git ~/.alacritty-colorscheme
