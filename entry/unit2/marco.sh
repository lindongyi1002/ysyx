#!/bin/bash

output_file=~/ysyx/entry/unit2/current_dir.txt

marco(){
    pwd | tee $output_file
}

polo(){
    cd $(cat $output_file)
}
