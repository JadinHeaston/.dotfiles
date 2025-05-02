script_dir=$(dirname "$0")

mkdir -p ~/.config/git/
rm -rf ~/.config/git/*
cp -rf $script_dir/../ ~/.config/git/