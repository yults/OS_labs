#!/bin/bash
mkfifo pipe
./obr.sh &
./gen.sh
rm pipe
