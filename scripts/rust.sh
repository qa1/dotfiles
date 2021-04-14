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
	echo "rust programming language with rustup"
}

main() {
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --no-modify-path

	# shellcheck disable=1090
	source "$HOME/.cargo/env"

	rustup component add clippy
	rustup component add rustfmt
	rustup component add rls rust-analysis rust-src
}
