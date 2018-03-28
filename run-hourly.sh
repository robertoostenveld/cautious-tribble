#!/bin/bash

AGE=60

LOCKDIR=/tmp/cautious-tribble
LOCKFILE=run-hourly.lock

if [ -f $LOCKDIR/$LOCKFILE ]; then
execute=$(find $LOCKDIR/$LOCKFILE -not -mmin +$AGE -exec echo no \;)
else
execute=yes
fi

if [ "$execute" == "no" ] ; then
  exit 0
fi

mkdir -p $LOCKDIR
touch $LOCKDIR/$LOCKFILE

echo running again after $AGE minutes
