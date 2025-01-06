#!/bin/bash
#export ARCH=aarch64
cd buildroot && AESD_ASSIGNMENTS_OVERRIDE_SRCDIR=/media/data/workspace/coursera/assignments-3-and-later-wlbe4 make aesd-assignments-rebuild && cd ..