sudo apt-get remove -y --purge vim vim-runtime vim-gnome vim-tiny vim-gui-common

sudo apt-get install -y \
   	python-dev \
   	python3-dev \
   	ruby-dev \
   	liblua5.2-dev \
   	libperl-dev \
   	libatk1.0-dev \
   	libncurses5-dev \
   	libx11-dev \
   	libxpm-dev \
   	libxt-dev

#Optional: so vim can be uninstalled again via `dpkg -r vim`
# sudo apt-get install checkinstall

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

./configure \
--enable-multibyte \
--enable-perlinterp=dynamic \
--enable-rubyinterp=dynamic \
--enable-pythoninterp=dynamic \
--with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
--enable-python3interp \
--with-python3-config-dir=/usr/local/lib/python3.6/config-3.6m-x86_64-linux-gnu \
--enable-luainterp \
--with-luajit \
--enable-cscope \
--enable-gui=auto \
--with-features=huge \
--with-x \
--enable-fontset \
--enable-largefile \
--disable-netbeans \
--with-compiledby="ClarkChiu" \
--enable-fail-if-missing

make -j 4 && sudo make install

rm -rf ~/vim/
