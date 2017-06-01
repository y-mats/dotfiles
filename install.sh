#!/bin/bash -me
if [ ! -f ${HOME}/.git-prompt.sh ]
then
  wget \
    'https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh' \
    --output-file=${HOME}/.git-prompt.sh
fi
if [ ! -f ${HOME}/.git-completion.bash ]
then
  wget \
    'https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash' \
    --output-file=${HOME}/.git-completion.bash
fi

cd $(dirname $0)
current_dir=$(pwd)
install ${current_dir}/bashrc ${HOME}/.bashrc
install ${current_dir}/vimrc  ${HOME}/.vimrc
