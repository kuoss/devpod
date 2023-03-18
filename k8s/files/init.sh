#!/bin/bash
cat <<EOF > /root/.bashrc
alias ls='ls --color'
alias ll='ls --color -l'
alias l='ls --color -lA'


cat <<EOF > ~/.git-credentials
https://$GIT_USER_NAME:$GITHUB_TOKEN@github.com
EOF
git config --global credential.helper 'store ~/.git-credentials'
code /ws
EOF

mkdir ~/.vscode-server 
ln -s ~/.vscode-server /ws/.vscode-server

git config --global user.name  $GIT_USER_NAME
git config --global user.email $GIT_USER_EMAIL
git config --global pull.rebase false

exec sleep infinity
