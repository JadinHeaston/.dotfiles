script_dir=$(dirname "$0")

mkdir -p "~/.config/nvim/"
rm -rf "~/.config/nvim/*"
cp -rf "$script_dir/../" "~/.config/nvim/"