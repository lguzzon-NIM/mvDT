#!/bin/bash
set -e
set -o pipefail
set -o xtrace

scversion="latest" # or "v0.4.7", or "latest"
wget -qO- "https://github.com/koalaman/shellcheck/releases/download/${scversion?}/shellcheck-${scversion?}.linux.x86_64.tar.xz" | tar -xJv
cp "shellcheck-${scversion}/shellcheck" /usr/bin/
shellcheck --version
