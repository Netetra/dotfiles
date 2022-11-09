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

# Rust Setup
#echo "Installing Rust stable..."
#sudo -u $user_name bash -c "cd /home/$user_name && rustup default stable > /dev/null"

#echo "Installing Rust tools... "
#sudo -u $user_name bash -c "cd /home/$user_name && rustup component add clippy rls rust-analysis rust-src rust-docs rustfmt > /dev/null"

# Install Sheldon
#echo "Installing sheldon..."
#sudo -u $user_name bash -c "cd /home/$user_name && sheldon init --shell zsh"
#sudo -u $user_name bash -c "cd /home/$user_name && sheldon add zsh-autosuggestions --github zsh-users/zsh-autosuggestions"
#sudo -u $user_name bash -c "cd /home/$user_name && sheldon add zsh-completions --github zsh-users/zsh-completions"
#sudo -u $user_name bash -c "cd /home/$user_name && sheldon add zsh-syntax-highlighting --github zsh-users/zsh-syntax-highlighting"