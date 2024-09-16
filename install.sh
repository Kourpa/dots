# /bin/bash

if [[ -z "$ZSH" ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

mv -f ~/.zshrc ~/.zshrc.$(date -I).backup
ln -s $PWD/.zshrc ~/.zshrc

mv -f ~/.tmux.config ~/.tmux.config.$(date -I).backup
ln -s $PWD/.tmux.config ~/.tmux.config

mkdir -p ~/.config
mv -f ~/.config/nvim ~/.config/nvim.$(date -I).backup
ln -s $PWD/config/nvim ~/.config/nvim

mv -f ~/.zshenv ~/.zshenv.$(date -I).backup
cp $PWD/.zshenv ~/.zshenv
