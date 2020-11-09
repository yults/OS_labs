#!/bin/bash
ps a u x > save.txt
cat save.txt | awk '$1=="yults"' | wc -l > 1.txt
cat save.txt | awk '$1=="yults" {print $2":"$11}' >> 1.txt
