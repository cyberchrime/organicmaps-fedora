#!/bin/bash

set -e
set -u

cd /ws
if [[ ! -e comaps ]]; then
    git clone --recurse-submodules https://codeberg.org/comaps/comaps.git comaps
fi
cd comaps
./configure.sh
./tools/unix/build_omim.sh -r desktop
