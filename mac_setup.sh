#
# Mac Terminal Setup
# zsh, homebrew, pyenv, pyenv-virtualenv-wrapper
#
# Probably don't actually run this at once. Run commands individually
#

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install zsh, zsh-completions
brew install zsh zsh-completions

# Delete the .zshrc file that the previous step created, since using Prezto as config framework
# May happen automatically (?)
rm -f ~/.zshrc

# Install prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Set ZSH to default
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
 ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
chsh -s $(which zsh)

# install htop
brew install htop

# Install pyenv
brew install pyenv

# Install python
pyenv install 3.8.10

# Install pyenv-virtualenv
brew install pyenv-virtualenv

# git stuff
git config --global user.email "example@example.com"
git config --global user.name "Sam Ryan"
# Use vim as default git editor
git config --global core.editor "vim" 
