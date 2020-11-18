#!/bin/bash
# In The Name of God
# ========================================
# [] File Name : cmus.sh
#
# [] Creation Date : 18-11-2020
#
# [] Created By : Parham Alvani <parham.alvani@gmail.com>
# =======================================

usage() {
        echo "usage: cmus"
}

main() {
        # Reset optind between calls to getopts
        OPTIND=1

        sudo pacman -Syu --noconfirm --needed cmus
        configfile cmus rc
}
