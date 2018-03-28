#!/bin/bash

LOCKDIR=/tmp/cautious-tribble
LOCKFILE=$LOCKDIR/cautious-tribble-once.lock

if [ -f $LOCKFILE ] ; then
  echo not running
  exit 0
fi

mkdir -p $LOCKDIR
touch $LOCKFILE

echo running once
