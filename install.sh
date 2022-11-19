# Clone dotfiles
mkdir ~/git
cd ~/git
git clone https://github.com/Netetra/dotfiles.git
cd ~

#Create SymbolicLink
mkdir ~/.config
ln -sf ~/git/dotfiles/.zshrc ~/.zshrc
ln -sf ~/git/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/git/dotfiles/.config/sway ~/.config/sway
ln -sf ~/git/dotfiles/.config/waybar ~/.config/waybar
ln -sf ~/git/dotfiles/.config/alacritty ~/.config/alacritty
ln -sf ~/git/dotfiles/.config/wofi ~/.config/wofi
ln -sf ~/git/dotfiles/.background ~/.background
ln -sf ~/git/dotfiles/.config/nvim ~/.config/nvim
