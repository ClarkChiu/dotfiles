# Clone the dotfiles from GitHub
git clone https://github.com/ClarkChiu/dotfiles ~/dotfiles

# Make the latest vim from source
#

# Setup the soft link for vim resource
mkdir ~/dotfiles/.vim/backup
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.vim ~/.vim

# Clean and Install the vim plugin
