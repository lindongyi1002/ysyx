#!/usr/bin/env bash

pidwait()
{
   if kill -0 $1;then
      sleep 1
   else
      ls
   fi
   #while kill -0 $1 #循环直到进程结束
   #do
   #sleep 1 
   #done
   #ls
}