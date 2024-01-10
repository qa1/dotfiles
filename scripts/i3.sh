#!/usr/bin/env bash

usage() {
	echo "i3 window manager for arch"

	echo '
 _ _____
(_)___ /
| | |_ \
| |___) |
|_|____/
  '
}

root=${root:?"root must be set"}

main_pacman() {
	msg 'install i3 (actually i3-gaps) with polybar'
	require_pacman i3-gaps xclip gtk3
	require_aur i3-scrot matcha-gtk-theme polybar i3exit

	configfile gtk-3.0 settings.ini i3
	configfile i3 "" i3
	configfile polybar "" i3

	msg 'ranger (cli-based file manager) with image preview'
	require_pacman ranger ueberzug
	configfile ranger "" i3

	msg 'better brightness control with brightnessctl'
	require_pacman brightnessctl

	msg 'x11/wayland image viewer'
	require_pacman imv

	msg 'pdf viewer'
	require_pacman mupdf

	msg 'picom is a standalone compositor for Xorg'
	require_pacman picom
	require_pacman unclutter
	configrootfile picom picom.conf i3

	msg 'notification with dunst'
	require_pacman dunst libnotify
	configfile dunst "" i3

	msg 'backgrounds with feh'
	require_pacman feh
	msg 'setup a systemd timer/service to change background images each 5 minutes with feh'
	configsystemd feh feh.timer i3
	configsystemd feh feh.service i3

	msg 'configure the dmenu, default application luncher on i3'
	linker dmenu "$root/i3/dmenurc" "$HOME/.dmenurc"
	chmod +x "$HOME/.dmenurc"

	msg 'configure rofi another application luncher'
	require_pacman rofi
	configfile rofi "" i3

	msg 'gnome-keyring/seahorse setup'
	require_pacman gnome-keyring seahorse

	# shellcheck disable=2016
	if ! grep -q -F 'eval "$(gnome-keyring-daemon --start 2>/dev/null)" >/dev/null 1>&2 && export SSH_AUTH_SOCK' \
		"$HOME/.profile"; then

		echo 'eval "$(gnome-keyring-daemon --start 2>/dev/null)" >/dev/null 1>&2 && export SSH_AUTH_SOCK' |
			tee -a "$HOME/.profile"
	fi

	msg 'pavucontrol, a panel for audio'
	require_pacman pavucontrol

	msg 'pulse-audio tray'
	require_pacman pasystray

	msg 'there is no power manager installed and all events will be handled by systemd'
	sudo cp "$root/i3/systemd/logind.conf" /etc/systemd/logind.conf

	msg 'enable feh services later to be a good post installation script'
	systemctl --user enable feh.timer
	systemctl --user start feh.timer
}

main_parham() {
	msg 'the wallpapers that we love'

	clone https://github.com/parham-alvani/wallpapers "$HOME/Pictures" "GoSiMac"
}
