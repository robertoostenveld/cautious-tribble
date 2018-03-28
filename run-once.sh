#!/bin/bash

LOCKDIR=/tmp/cautious-tribble
LOCKFILE=run-once.lock

if [ -f /tmp/cautious-tribble/run-once.lock ] ; then
  echo not running
  exit 0
fi

mkdir -p $LOCKDIR
touch $LOCKDIR/$LOCKFILE

echo running once
