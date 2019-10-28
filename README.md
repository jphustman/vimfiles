```
cd ~
git clone git@github.com:jphustman/vimfiles
```
Backup and merge in the following existing dotfiles

vim:
configure --enable-gui=gtk2 --enable-pythoninterp

Need:
https://aur.archlinux.org/packages/python-powerline-git/

# Arch Linux
sudo pacman -S gvim ctags ruby ack


Will need powerline fonts from
https://github.com/powerline/fonts


```
ln -s vimfiles/.vimrc .vimrc
ln -s vimfiles/.jslintrc .jslintrc
ln -s vimfiles/.bash_profile .bash_profile
ln -s vimfiles/.bash_logout .bash_logout
ln -s vimfiles/.bashrc .bashrc
ln -s vimfiles/.Xresources .Xresources
ln -s vimfiles/tslint.json tslint.json
ln -s vimfiles/.tmux.conf .tmux.conf

git clone git@github.com:Shougo/dein.vim .cache/dein/repos/github.com/Shougo/dein.vim

vim

call dein#update() to update
call dein#install() to install
```
