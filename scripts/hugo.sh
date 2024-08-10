#!/usr/bin/env bash
usage() {
    echo "The world’s fastest framework for building websites"

    # shellcheck disable=1004,2016
    echo '
 _
| |__  _   _  __ _  ___
| |_ \| | | |/ _` |/ _ \
| | | | |_| | (_| | (_) |
|_| |_|\__,_|\__, |\___/
             |___/
  '
}

main_pacman() {
    require_pacman hugo
}

main_brew() {
    require_brew hugo
}

main() {
    return 0
}

main_parham() {
    return 0
}
