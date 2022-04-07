#!/bin/bash

dd if=/dev/zero of=output.txt  bs=$1  count=1 &> /dev/null

hdfs dfs -Ddfs.replication=1 -put output.txt file.data &> /dev/null

all_sizes=$(hdfs fsck /user/hjudge/file.data -files -blocks -locations 2> /dev/null | head -n -21 | tail -n +3 | sed -e 's/.*len=\(.*\) Live_repl.*/\1/')

sum_of_blocks=$(echo $all_sizes | paste -sd+ | bc)

echo "$(($sum_of_blocks - $1))"

hdfs dfs -rm file.data &> /dev/null

rm output.txt
