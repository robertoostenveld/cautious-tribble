#!/bin/bash

if [ -f /tmp/cautious-tribble/run-once.lock ] ; then
  exit 0
fi

touch /tmp/cautious-tribble/run-once.lock

echo running once
