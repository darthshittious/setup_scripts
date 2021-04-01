sudo apt update && sudo apt upgrade -y
curdir="$(dirname "$0")"
olddir="$(pwd)"
cd "$curdir" || exit
./postgres.sh
./python.sh
./rust.sh
./useful.sh
./web.sh
cd "$olddir" || exit
sudo apt install language-pack-en
export LC_ALL="en_GB.UTF-8"
sudo dpkg-reconfigure locales

function windowssucks {
  sed -i 's/\r//g' ./*
}
export -f windowssucks
alias windows_sucks=windowssucks
