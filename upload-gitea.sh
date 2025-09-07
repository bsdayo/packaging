#!/bin/sh

# Usage: upload-gitea.sh <package.deb>

if [[ -n $GITEA_ACTIONS ]]; then
    echo "Not running in Gitea Actions, skipping upload"
    exit 0
fi

extension=${1##*.}
case "${extension}" in
deb)
    echo "Uploading deb package to Gitea"
    curl -fsSL -u "${GITEA_ACTOR}:${PACKAGES_TOKEN}" -T *.deb \
        "${GITEA_SERVER_URL}/api/packages/${GITEA_ACTOR}/debian/pool/stable/main/upload"
    ;;
*)
    echo "Unsupported package type: ${extension}, skipping upload"
    exit 0
    ;;
esac
