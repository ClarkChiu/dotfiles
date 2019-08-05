# Install the latest Vim from source and setting up the vimrc

## Clone the dotfiles from GitHub
# git clone https://github.com/ClarkChiu/dotfiles ~/dotfiles

## Update the latest Vim plugin manager
mkdir -p ~/dotfiles/.vim/autoload/
curl https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim > ~/dotfiles/.vim/autoload/plug.vim

## Make the latest vim from source
sh ~/dotfiles/script/VimCompileScript.sh

## Setup the soft link for vim resource
mkdir -p ~/dotfiles/.vim/backup

unlink ~/.vim
unlink ~/.vimrc
ln -sf ~/dotfiles/.vim/vimrc ~/.vimrc
ln -sf ~/dotfiles/.vim ~/.vim

## Clean and Install the vim plugin
mkdir -p ~/dotfiles/.vim/plugged
vim +'PlugInstall --sync' +qall &> /dev/null
