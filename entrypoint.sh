#!/bin/bash

set -e
set -u

cd /ws
git clone https://github.com/organicmaps/organicmaps organicmaps
cd organicmaps
./tools/unix/build_omim.sh -r desktop
