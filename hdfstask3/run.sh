#!/usr/bin/env bash
FSCK_OUTPUT=$(hdfs fsck "$@" -files -locations -blocks | grep -m 1 'Total blocks')
python3 hdfstask3.py "${FSCK_OUTPUT}"