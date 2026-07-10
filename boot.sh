#!/bin/sh

# This script is designed to make setting up a new machine a simple one-line
# command. While most of the bootstrapping work is done by mise, mise can't
# install itself or any other prerequisites needed on the machine before running
# mise. So this script sets up those things first and then hands off the rest of
# the bootstrap proess to mise.

if ! command -v mise >/dev/null 2>&1; then
  echo "mise is not installed, installing mise..."
  curl https://mise.run | sh
fi

mise bootstrap
