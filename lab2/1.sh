#!/bin/bash
ps a u x | awk '$1=="yults"' | wc -l > 1.txt
ps a u x | awk '$1=="yults" {print $2":"$11}' >> 1.txt
