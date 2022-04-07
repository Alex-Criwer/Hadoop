#!/usr/bin/env bash

IFS='/' read -ra my_array <<< "$@"
block_id=${my_array[-1]}

SERVER_NAME=$(hdfs fsck -blockId "$block_id" | grep -o mipt-node[0-9]*.atp-fivt.org | tail -n 1)

PATH=$(sudo -u hdfsuser ssh hdfsuser@${SERVER_NAME} -tt find /dfs/ -name "$block_id")

echo "${SERVER_NAME}:${PATH}"