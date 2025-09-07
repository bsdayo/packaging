#!/bin/sh

case "${1}" in
armv7)
    echo "armhf"
    ;;
armv8)
    echo "arm64"
    ;;
386)
    echo "i386"
    ;;
x64)
    echo "amd64"
    ;;
*)
    echo ${1}
    ;;
esac
