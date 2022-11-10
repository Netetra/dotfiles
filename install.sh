# Clone dotfiles
mkdir /home/$user_name/git
cd /home/$user_name/git
git clone https://github.com/Netetra/dotfiles.git
cd /home/$user_name

#Create SymbolicLink
mkdir /home/$user_name/.config
ln -sf /home/$user_name/git/dotfiles/.zshrc /home/$user_name/.zshrc
ln -sf /home/$user_name/git/dotfiles/.tmux.conf /home/$user_name/.tmux.conf
ln -sf /home/$user_name/git/dotfiles/.config/sway /home/$user_name/.config/sway
ln -sf /home/$user_name/git/dotfiles/.config/waybar /home/$user_name/.config/waybar
ln -sf /home/$user_name/git/dotfiles/.config/alacritty /home/$user_name/.config/alacritty
ln -sf /home/$user_name/git/dotfiles/.config/wofi /home/$user_name/.config/wofi
ln -sf /home/$user_name/git/dotfiles/.background /home/$user_name/.background
