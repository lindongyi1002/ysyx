#!/bin/bash

output_file=~/ysyx/ysyx-workbench/entry/current_dir.txt

marco(){
    pwd | tee $output_file
}

polo(){
    cd $(cat $output_file)
}
