#!/bin/bash
./obr.sh&pid=$!
./gen.sh $pid
