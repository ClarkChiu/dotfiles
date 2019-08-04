sudo apt-get remove -y --purge vim vim-runtime vim-gnome vim-tiny vim-gui-common

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
   	git

sudo rm -rf /usr/local/share/vim /usr/bin/vim

cd ~
git clone https://github.com/vim/vim
cd vim
git pull && git fetch
git clean -fdx

#In case Vim was already installed
cd src
make distclean
cd ..

PYTHON2_CONFIG_DIR='/usr/lib/python2.7/config-x86_64-linux-gnu'
PYTHON3_CONFIG_DIR='/usr/local/lib/python3.6/config-3.6m-x86_64-linux-gnu'

./configure \
	--with-features=huge \
    --enable-multibyte \
	--enable-largefile \
	--enable-rubyinterp=yes \
	--enable-perlinterp=yes \
	--enable-luainterp=yes \
	--enable-pythoninterp=yes \
	--with-python-config-dir=$PYTHON2_CONFIG_DIR \
	--enable-python3interp=yes \
	--with-python3-config-dir=$PYTHON3_CONFIG_DIR \
	--prefix=/usr/local \
    --enable-gui=no \
    --enable-cscope \
	--disable-netbeans \
	--with-compiledby="ClarkChiu"

make -j 4 && sudo make install

rm -rf ~/vim/
