#!/bin/bash
cut -d':' -f1,3 /etc/passwd | sort -nt':' -k2
