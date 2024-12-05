#!/usr/bin/env bash
usage() {
    echo "Launch Termux commands from the homescreen"

    # shellcheck disable=1004,2016
    echo '
 _                                              _     _            _
| |_ ___ _ __ _ __ ___  _   ___  __   __      _(_) __| | __ _  ___| |_
| __/ _ \ |__| |_ ` _ \| | | \ \/ /___\ \ /\ / / |/ _` |/ _` |/ _ \ __|
| ||  __/ |  | | | | | | |_| |>  <_____\ V  V /| | (_| | (_| |  __/ |_
 \__\___|_|  |_| |_| |_|\__,_/_/\_\     \_/\_/ |_|\__,_|\__, |\___|\__|
                                                        |___/
  '
}

pre_main() {
    return 0
}

main_pacman() {
    return 1
}

main_xbps() {
    return 1
}

main_apt() {
    return 1
}

main_pkg() {
    dotfile "tmux-widgets" "shortcuts"
}

main_brew() {
    return 1
}

main() {
    return 0
}

main_parham() {
    return 0
}
