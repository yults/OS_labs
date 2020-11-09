#!/bin/bash
ps a u x | awk '{if($11 ~ /^\/sbin\/.*/) print $2}' >> 2.txt
