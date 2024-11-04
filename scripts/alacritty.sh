#!/usr/bin/env bash

usage() {
    echo -n "alacritty terminal with jetbrains mono font and configuration"
    # shellcheck disable=2016
    echo '
       _                 _ _   _
  __ _| | __ _  ___ _ __(_) |_| |_ _   _
 / _` | |/ _` |/ __| |__| | __| __| | | |
| (_| | | (_| | (__| |  | | |_| |_| |_| |
 \__,_|_|\__,_|\___|_|  |_|\__|\__|\__, |
                                   |___/
	'
}

root=${root:?"root must be set"}

main_brew() {
    require_brew_cask alacritty
}

main_apt() {
    require_apt alacritty
}

main_pacman() {
    require_pacman alacritty
}

main() {
    mkdir -p ~/.config/alacritty/themes
    git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
    configfile alacritty
}
