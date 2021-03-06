#!/bin/bash
# In The Name of God
# ========================================
# [] File Name : julia.sh
#
# [] Creation Date : 27-09-2019
#
# [] Created By : Parham Alvani <parham.alvani@gmail.com>
# =======================================

version='1.3.1'

usage() {
        echo "usage: julia"
}

download_julia() {
        local_version="-"
        if hash julia 2>/dev/null; then
                local_version=$(julia --version | cut -d ' ' -f 3)
        fi
        if [ $local_version == $version ]; then
                message "julia" "you have installed julia ${local_version}"
                return
        fi

        message "julia" "install ${version}"
        curl -L https://julialang-s3.julialang.org/bin/linux/x64/${version%.*}/julia-${version}-linux-x86_64.tar.gz | tar xvfz -
        if [ -e /opt/julia ]; then
                sudo rm -r -f /opt/julia
        fi
        sudo mv julia-${version} /opt/julia
        if [ -e /usr/local/bin/julia ]; then
                sudo rm -r -f /usr/local/bin/julia
        fi
        sudo ln -s /opt/julia/bin/julia /usr/local/bin/julia
}

main() {
        # Reset optind between calls to getopts
        OPTIND=1
        if [[ "$OSTYPE" == "darwin"* ]]; then
                brew cask install julia
        else
                download_julia
        fi
}
