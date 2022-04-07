#!/usr/bin/env bash

FSCK_OUTPUT=$(hdfs fsck "$@" -files -locations -blocks | grep -m 1 DatanodeInfoWithStorage)

python3 hdfstask1.py "${FSCK_OUTPUT}"
