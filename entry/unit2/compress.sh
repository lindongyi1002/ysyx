#!/usr/bin/env bash

find ./ -name "*.html" | xargs zip -r html_files.zip 

unzip -l html_files.zip