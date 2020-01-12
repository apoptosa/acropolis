#!/bin/sh
###############################################################################

# specify settings for ccache

# export CCACHE_DIR=${local_bucket}/tmp/.ccache
export CCACHE_DIR=/dev/shm/.ccache
export CCACHE_MAXSIZE=1G
export CCACHE_SLOPPINESS=file_macro,locale,time_macros
