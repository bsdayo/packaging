#!/bin/sh

# Usage: upload-gitea.sh <package.deb>

set -e

extension=${1##*.}
case "${extension}" in
deb)
    url="${GITHUB_SERVER_URL}/api/packages/${GITHUB_ACTOR}/debian/pool/stable/main/upload"
    echo "Uploading to ${url}"
    curl -fsSL -u "${GITHUB_ACTOR}:${PACKAGES_TOKEN}" -T $1 $url
    ;;
*)
    echo "Unsupported package type: ${extension}, skipping upload"
    exit 0
    ;;
esac
