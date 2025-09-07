#!/bin/sh

# Usage: upload-gitea.sh <package.deb>

set -e

if [ -z $GITEA_ACTIONS ]; then
    echo "Not running in Gitea Actions, skipping upload"
    exit 0
fi

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
