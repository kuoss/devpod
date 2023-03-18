#!/bin/bash
cat <<EOF > /root/.bashrc
alias ls='ls --color'
alias ll='ls --color -alF'
alias l='ls --color -lA'

echo "https://$GIT_USER_NAME:$GITHUB_TOKEN@github.com" > ~/.git-credentials
git config --global credential.helper 'store --file ~/.git-credentials'
code /ws
EOF

mkdir /ws/.vscode-server
ln -s /ws/.vscode-server ~/.vscode-server

git config --global user.name   $GIT_USER_NAME
git config --global user.email  $GIT_USER_EMAIL
git config --global pull.rebase false

[ ! -d devpod ] \
&& git clone https://github.com/kuoss/devpod.git \
&& ln -rs /ws/devpod/Makefile.txt /ws/Makefile

exec sleep infinity
