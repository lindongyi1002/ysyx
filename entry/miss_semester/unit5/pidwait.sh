#!/usr/bin/env bash

pidwait()
{
   while kill -0 $1;do  #if process does not exist ,kill -0 will return a non-zero status code, and exit while cycle to run 'ls'
                        #so if process exist, the result of 'kill -0 $1' is 0, and enter while cycle to run 'sleep 1'
      sleep 1 
   done
   ls
}