Dotfiles
========

My configuration files

To set them up:

1) Clone the repo
```
cd ~
git clone https://github.com/chipjacks/dotfiles
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vim ~/.vim
ln -s [whatever else needs to be in my home dir]
```

2) Open Vim and install plugins using Vundle:
```
:PluginInstall
```

3) Compile YouCompleteMe
```
~/.vim/bundle/YouCompleteMe/install.sh --clang-completer
```

4) Call it a day