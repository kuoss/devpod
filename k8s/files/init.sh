#!/bin/bash
cat <<EOF > /root/.bashrc
alias ls='ls --color'
alias ll='ls --color -l'
alias l='ls --color -lA'
code /ws
EOF

git config --global user.name  $GIT_USER_NAME
git config --global user.email $GIT_USER_EMAIL
git config --global pull.rebase false 

exec sleep infinity
