mkdir ~/.fonts
for f in "$(dirname "$0")"/*.zip; do dirname=$(basename "$f" .zip); mkdir -p "$HOME/.fonts/$dirname" && unzip "$f" -d "$HOME/.fonts/$dirname"; done
fc-cache -fv