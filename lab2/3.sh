#!/bin/bash 
ps a u x | tail --lines=1 | awk '{ print $2 " " $9 }'
