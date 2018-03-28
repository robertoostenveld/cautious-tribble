#!/bin/bash

# from https://gist.github.com/lukechilds/a83e1d7127b78fef38c2914c4ececc3c
get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}

RELEASE=$(get_latest_release robertoostenveld/cautious-tribble)

LOCKDIR=/tmp/cautious-tribble
LOCKFILE=$LOCKDIR/cautious-tribble-$RELEASE.lock

if [ -f $LOCKFILE ] ; then
  echo not running
  exit 0
fi

mkdir -p $LOCKDIR
touch $LOCKFILE

echo running once for $RELEASE
