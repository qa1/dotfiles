#!/bin/bash
usage() {
	echo "Code editing. Redefined."

	# shellcheck disable=1004,2016
	echo '
               _
  ___ ___   __| | ___
 / __/ _ \ / _` |/ _ \
| (_| (_) | (_| |  __/
 \___\___/ \__,_|\___|
  '
}

main_pacman() {
	msg 'insider belongs to parham and stable belongs to michael'
	require_aur visual-studio-code-insiders-bin visual-studio-code-bin
}

main_brew() {
	require_brew_cask visual-studio-code
}

main() {
	return 0
}

main_parham() {
	return 0
}
