```
cd ~
git clone git@github.com:jphustman/vimfiles
```
Backup and merge in the following existing dotfiles

vim:
configure --enable-gui=gtk2 --enable-pythoninterp


```
ln -s vimfiles/.vimrc .vimrc
ln -s vimfiles/.jslintrc .jslintrc
ln -s vimfiles/.bash_profile .bash_profile
ln -s vimfiles/.bash_logout .bash_logout
ln -s vimfiles/.bashrc .bashrc
ln -s vimfiles/.Xresources .Xresources
ln -s vimfiles/tslint.json tslint.json
ln -s vimfiles/.tmux.conf .tmux.conf

git clone git@github.com:Shougo/dein.vim .vim/bundle/repos/github.com/Shougo/dein.vim

vim

call dein#update() to update
call dein#install() to install
```
