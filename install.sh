#!/bin/bash -me
if [ ! -f ${HOME}/.git-prompt.sh ]
then
  wget \
    'https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh' \
    -O ${HOME}/.git-prompt.sh
fi
if [ ! -f ${HOME}/.git-completion.bash ]
then
  wget \
    'https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash' \
    -O ${HOME}/.git-completion.bash
fi

cd $(dirname $0)
current_dir=$(pwd)
cat << 'EOS' >> $HOME/.bashrc
if [ -f $HOME/dotfiles/my_env ]
then
    source $HOME/dotfiles/my_env
fi
EOS
install -m 664 ${current_dir}/vimrc  ${HOME}/.vimrc
mkdir -p ${HOME}/tmp
