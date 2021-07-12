
GIT_ROOT="$HOME/git"
if [ -d $GIT_ROOT ];
then
	git clone https://github.com/luoye003/myconfig.git $GIT_ROOT
	ln -s "$GIT_ROOT/myconfig/.tmux.conf" "$HOME"
	ln -s "$GIT_ROOT/myconfig/.zshrc.conf" "$HOME"
	ln -s "$GIT_ROOT/myconfig/init.vim" "$HOME/.config/nvim/"
	ln -s "$GIT_ROOT/myconfig/.ideavimrc" "$HOME"
fi
