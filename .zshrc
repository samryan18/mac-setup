# source prezto
#
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# pyenv stuff
#
export PYENV_ROOT="$HOME/.pyenv"
export PATH=/bin:/usr/bin:/usr/local/bin:${PATH}
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH=~/bin:$PATH

if command -v pyenv 1>/dev/null 2>&1; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

alias workon="pyenv activate"
alias mkvirtualenv="pyenv virtualenv 3.7.10"
alias lsvirtualenv="pyenv virtualenvs"
alias deactivate="pyenv deactivate"
alias rmvirtualenv="pyenv virtualenv-delete"

# git stuff
#
git config --global user.email "my_email@gmail.com"
git config --global user.name "My Name"
git config --global alias.logline "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global core.editor "vim"
