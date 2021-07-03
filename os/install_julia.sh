#!/usr/bin/env bash

readonly JULIA_VERSION="1.6.2"
readonly JULIA_RELEASE_URL="https://julialang-s3.julialang.org/bin/linux/x64/1.6/julia-${JULIA_VERSION}-linux-x86_64.tar.gz"
readonly JULIA_PACKAGE_NAME="julia-${JULIA_VERSION}"

mkdir -p /tmp/install_julia && cd /tmp/install_julia
wget ${JULIA_RELEASE_URL} -O "${JULIA_PACKAGE_NAME}.tar.gz"
tar -xvzf "${JULIA_PACKAGE_NAME}.tar.gz"

sudo -l
sudo cp -r ${JULIA_PACKAGE_NAME} /opt/
sudo ln -s /opt/${JULIA_PACKAGE_NAME} /opt/julia
sudo ln -s /opt/julia/bin/julia /usr/local/bin/julia
