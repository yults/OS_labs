#!/bin/bash
grep -r -E -o -s -h '[a-zA-Z0-9._]+@[a-zA-Z]+(\.[a-zA-Z]+)' /etc | sort | uniq | awk '{printf ("%s, ", $1)}' > emails.lst
