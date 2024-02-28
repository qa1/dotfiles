#!/usr/bin/env bash

usage() {
	echo "install nodejs, remembers language-servers must of the time needs nodejs"
	# shellcheck disable=1004
	echo '
                 _
 _ __   ___   __| | ___
| |_ \ / _ \ / _| |/ _ \
| | | | (_) | (_| |  __/
|_| |_|\___/ \__|_|\___|

  '
}

main_brew() {
	msg "install node using brew"
	require_brew node
}

main_apt() {
	msg "installing node from node source apt repository (https://github.com/nodesource/distributions)"
	curl -fsSL https://deb.nodesource.com/setup_21.x | sudo -E bash - &&
		sudo apt-get install -y nodejs

}

main_pacman() {
	msg "install node using pacman"
	require_pacman nodejs npm
}

main() {
	msg "$(node -v)"

	dotfile "npm" "npmrc"
}
