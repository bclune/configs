# symlink configs to the correct places
ln -s ~/configs/.bash ~/.bash
ln -s ~/configs/.vim ~/.vim
ln -s ~/configs/.vimrc ~/.vimrc
ln -s ~/configs/.xmonad ~/.xmonad
rm ~/.bashrc
ln -s ~/configs/.bashrc ~/.bashrc
mkdir -p ~/.ssh
cd ~/configs && git submodule init && git submodule update
