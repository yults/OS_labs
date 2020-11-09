#!/bin/bash
./cycle.sh & pid0=$!
./cycle.sh & pid1=$!
./cycle.sh & pid2=$!
renice +10 -p $pid0
kill $pid2
