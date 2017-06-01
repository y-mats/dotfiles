# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
# git 関連のユーティリティが存在したらロードする
if [ -e $HOME/.git-completion.bash ]
then
  . $HOME/.git-completion.bash
fi
if [ -e $HOME/.git-prompt.sh ]
then
  . $HOME/.git-prompt.sh
  export PS1='[\u@\h \w$(__git_ps1 " (%s)")]\$ '
else
  export PS1='[\u@\h \w]\$ '
fi
# プロンプトにフルパスを表示
# screen のエージェント転送用設定
agent="$HOME/tmp/ssh-agent-$USER"
if [ -S "$SSH_AUTH_SOCK" ]; then
  case $SSH_AUTH_SOCK in
  /tmp/*/agent.[0-9]*)
    ln -snf "$SSH_AUTH_SOCK" $agent && export SSH_AUTH_SOCK=$agent
  esac
elif [ -S $agent ]; then
  export SSH_AUTH_SOCK=$agent
else
  echo "no ssh-agent"
fi
