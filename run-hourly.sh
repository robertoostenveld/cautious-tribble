#!/bin/bash

AGE=60

LOCKDIR=/tmp/cautious-tribble
LOCKFILE=$LOCKDIR/cautious-tribble-hourly.lock

if [ -f $LOCKFILE ]; then
  execute=$(find $LOCKFILE -not -mmin +$AGE -exec echo no \;)
else
  execute=yes
fi

if [ "$execute" == "no" ] ; then
  echo not running
  exit 0
fi

mkdir -p $LOCKDIR
touch $LOCKFILE

echo running once after $AGE minutes
