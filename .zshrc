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
alias mkvirtualenv="pyenv virtualenv 3.6.6"
alias lsvirtualenv="pyenv virtualenvs"
alias deactivate="pyenv deactivate"
alias rmvirtualenv="pyenv rmvirtualenv"

# git stuff
#
git config --global user.email "example@example.com"
git config --global user.name "Sam Ryan"