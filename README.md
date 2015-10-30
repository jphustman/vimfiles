cd ~
git clone git@github.com:jphustman/vimfiles

Backup and merge in the following existing dotfiles

ln -s vimfiles/.vimrc .vimrc
ln -s vimfiles/.jslintrc .jslintrc
ln -s vimfiles/.bash_profile .bash_profile
ln -s vimfiles/.bash_logout .bash_logout
ln -s vimfiles/.bashrc .bashrc
ln -s vimfiles/.Xresources .Xresources

git clone git@github.com:Shougo/neobundle.vim .vim/bundle/neobundle.vim
vim +NeoBundleInstall!
