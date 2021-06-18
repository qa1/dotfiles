#!/bin/bash
# In The Name of God
# ========================================
# [] File Name : sample.sh
#
# [] Creation Date : 17-07-2018
#
# [] Created By : Parham Alvani <parham.alvani@gmail.com>
# =======================================

usage() {
	echo "fonts for terminal, subtitles and more"
	echo '
  __             _
 / _| ___  _ __ | |_
| |_ / _ \| |_ \| __|
|  _| (_) | | | | |_
|_|  \___/|_| |_|\__|

  '
}

main_brew() {
	brew install --cask homebrew/cask-fonts/font-jetbrains-mono
}

main_pacman() {
	sudo pacman -Syu --needed --noconfirm noto-fonts-emoji ttf-roboto ttf-jetbrains-mono ttf-font-awesome
	yay -Syu --needed --noconfirm ttf-meslo
	yay -Syu --needed --noconfirm vazir-fonts
	yay -Syu --needed --noconfirm vazir-code-fonts
	# yay -Syu --needed --noconfirm borna-fonts
	yay -Syu --needed --noconfirm ttf-times-new-roman
}

main_apt() {
	msg 'install roboto font from apt repository'
	sudo apt-get install fonts-roboto

	jbm_version="2.225"
	msg "install jetbrains mono ($jbm_version) by dowloading its archive"

	rm "JetBrainsMono-$jbm_version.zip" || true
	rm -Rf jb || true

	wget "https://download.jetbrains.com/fonts/JetBrainsMono-$jbm_version.zip"
	unzip "JetBrainsMono-$jbm_version.zip" -d jb && rm "JetBrainsMono-$jbm_version.zip"

	mv jb/fonts/ttf/* "$HOME/.local/share/fonts/" && rm -Rf jb

	vzc_version="1.1.2"
	msg "install vazir code ($vzc_version) by downloading its archive"

	rm "vazir-code-font-v$vzc_version.zip" || true
	rm -Rf vzc || true

	wget "https://github.com/rastikerdar/vazir-code-font/releases/download/v$vzc_version/vazir-code-font-v$vzc_version.zip"
	unzip "vazir-code-font-v$vzc_version.zip" -d vzc && rm "vazir-code-font-v$vzc_version.zip"

	mv vzc/Vazir-Code.ttf "$HOME/.local/share/fonts" && rm -Rf vzc
}
