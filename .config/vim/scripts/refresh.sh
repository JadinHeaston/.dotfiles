script_dir=$(dirname "$0")

mkdir -p ~/.config/vim/
rm -rf ~/.config/vim/*
cp -rf $script_dir/../ ~/.config/vim/
