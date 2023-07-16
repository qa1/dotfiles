#!/bin/bash

export additionals=(wayland)

usage() {
	echo "i3-compatible Wayland compositor"
	# shellcheck disable=1004,2028
	echo '
 _____      ____ _ _   _
/ __\ \ /\ / / _| | | | |
\__ \\ V  V / (_| | |_| |
|___/ \_/\_/ \____|\___ |
                   |___/
  '
}

root=${root:?"root must be set"}

main_pacman() {
	msg 'install and configure sway and swaylock'
	if yes_or_no 'do you want to use stable release?'; then
		pkgs=(sway-git swaylock-git wlroots-git swayidle-git swaybg-git)
		for pkg in "${pkgs[@]}"; do
			sudo pacman -Rsu "$pkg" || true
		done

		require_pacman sway wlroots swaylock swayidle swaybg
	else
		pkgs=(sway swaylock wlroots swayidle swaybg)
		for pkg in "${pkgs[@]}"; do
			sudo pacman -Rsu "$pkg" || true
		done

		require_aur sway-git wlroots-git swaylock-git swayidle-git swaybg-git
		copycat "sway" archinstall/sway.d/sway.desktop /usr/share/wayland-sessions/sway.desktop
		copycat "sway" archinstall/sway.d/sway.sh /usr/local/bin/sway.sh
	fi
	require_pacman xdg-desktop-portal-wlr

	configfile sway "" sway
	configfile swaylock "" sway
	sudo usermod -aG input "$USER"

	msg 'you can install sway-git with wlroots-git in the future'

	msg 'dynamic display configuration'
	require_pacman kanshi
	configfile kanshi "" sway
}
