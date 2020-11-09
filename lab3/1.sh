#!/bin/bash
date=$(date '+%d.%m.%y_%H:%M:%S')
mkdir ~/test && { echo "catalog test was created successfully" > ~/report
touch ~/test/$date 
}
ping www.net_nikogo.ru || echo "${date} host not available" >> ~/report

