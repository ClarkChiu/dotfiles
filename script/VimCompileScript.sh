# Tested on Ubuntu v18.04
# Remove exists Vim
sudo apt-get remove -y --purge vim vim-runtime vim-gnome vim-tiny vim-gui-common
sudo rm -rf /usr/local/share/vim /usr/bin/vim

# Install required packages
sudo apt-get update
sudo apt-get install -y \
   	python-dev \
   	python3-dev \
   	ruby-dev \
   	libperl-dev \
   	libatk1.0-dev \
   	libncurses5-dev \
   	libx11-dev \
   	libxpm-dev \
   	libxt-dev \
	liblua5.3-dev \
	lua5.3 \
   	git

pip3 install --user pynvim

# link the libs of lua
sudo rm -f /usr/include/lua /usr/local/lib/liblua.so
sudo ln -s /usr/include/lua5.3 /usr/include/lua
sudo ln -s /usr/lib/x86_64-linux-gnu/liblua5.3.so /usr/local/lib/liblua.so

# Make the Vim from source
cd ~
git clone https://github.com/vim/vim
cd vim
git pull && git fetch
git clean -fdx

cd src
make distclean
cd ..

./configure \
	--with-features=huge \
    --enable-multibyte \
	--enable-largefile \
	--enable-rubyinterp=yes \
	--enable-perlinterp=yes \
	--enable-luainterp=yes \
	--enable-python3interp=yes \
    --enable-gui=no \
    --enable-cscope \
	--disable-netbeans \
	--enable-fail-if-missing \
	--prefix=/usr/local \
	--with-compiledby="Clark Chiu"

make -j 4 && sudo make install

rm -rf ~/vim/
