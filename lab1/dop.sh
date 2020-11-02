#!/bin/bash
sudo find /var/log -type f | awk '{print $0 "\n\n"}' > dop.txt
