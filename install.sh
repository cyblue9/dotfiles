ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.gitexclude ~/.gitexclude
ln -s ~/dotfiles/.vim ~/.vim

# set up oh-my-zsh
git submodule add https://github.com/robbyrussell/oh-my-zsh.git
~/dotfiles/oh-my-zsh/tools/install.sh | ZSH=~/dotfiles/oh-my-zsh sh

# install oh-my-zsh plugins
git submodule add https://github.com/zsh-users/zsh-autosuggestions.git
ln -s ~/dotfiles/zsh-autosuggestions ~/dotfiles/oh-my-zsh/custom/plugins/

git submodule add https://github.com/zsh-users/zsh-completions.git
ln -s ~/dotfiles/zsh-completions ~/dotfiles/oh-my-zsh/custom/plugins/

git submodule add https://github.com/zsh-users/zsh-syntax-highlighting.git
ln -s ~/dotfiles/zsh-syntax-highlighting ~/dotfiles/oh-my-zsh/custom/plugins/

ln -f ~/dotfiles/mytheme.zsh-theme ~/dotfiles/oh-my-zsh/custom/themes/
