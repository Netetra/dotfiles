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
