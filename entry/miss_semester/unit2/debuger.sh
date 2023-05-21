#!/usr/bin/env bash

for i in {1..1000}; do
    ./err_cmd.sh > tmp.txt
    if [[ $(sed -n '1p' tmp.txt) = 'Something went wrong' ]]; then
        echo "error in i = $i"
        break
    fi
done