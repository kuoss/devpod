#!/bin/bash
cat <<EOF > /root/.bashrc
alias ls='ls --color'
alias ll='ls --color -l'
alias l='ls --color -lA'
git config --global credential.helper ''
echo $GH_TOKEN | GH_TOKEN= gh auth login --with-token
code /ws
EOF

git config --global user.name  $GIT_USER_NAME
git config --global user.email $GIT_USER_EMAIL
git config --global pull.rebase false

sleep infinity
