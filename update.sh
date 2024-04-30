cp ~/.vimrc .
cp -r ~/.config/i3/ dotconfig
cp -r ~/.config/zsh/ dotconfig
cp -r ~/.config/alacritty/ dotconfig
cp -r ~/.config/clangd/ dotconfig
cp -r ~/CompetitiveProgramming/Library CompetitiveProgramming/
cp -r ~/scripts/ .
git add *
git commit -m 'a'
git push
