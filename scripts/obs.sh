#!/bin/bash
usage() {
	echo "Open Broadcaster Software®"

	# shellcheck disable=1004,2016
	echo '
       _
  ___ | |__  ___
 / _ \| |_ \/ __|
| (_) | |_) \__ \
 \___/|_.__/|___/
  '
}

main_pacman() {
	require_pacman obs-studio
}

main_apt() {
	return 1
}

main_brew() {
	return 1
}

main() {
	return 0
}
