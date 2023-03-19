#!/bin/bash
cat <<'EOF' > /root/.bashrc
alias ls='ls --color'
alias ll='ls --color -alF'
alias l='ls --color -lA'

echo "https://$GIT_USER_NAME:$GITHUB_TOKEN@github.com" > ~/.git-credentials
git config --global credential.helper 'store --file ~/.git-credentials'

git config --global user.name  $GIT_USER_NAME
git config --global user.email $GIT_USER_EMAIL

code /ws
EOF

rm -rf   /ws/lost+found
mkdir -p /ws/.vscode-server
ln -s    /ws/.vscode-server ~/.vscode-server

[ ! -d devpod   ] && git clone https://github.com/kuoss/devpod.git
[ ! -f Makefile ] && ln -rs devpod/Makefile.txt Makefile
[ ! -d .vscode  ] && ln -rs devpod/.vscode      .vscode
git config --global pull.rebase false  
cd devpod && git pull

echo devpod started...
exec sleep infinity
