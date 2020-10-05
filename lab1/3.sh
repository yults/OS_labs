#!/bin/bash
echo "Press 1 for nano"
echo "Press 2 for vi"
echo "Press 3 for links"
echo "Press 4  for exit"
read but 
while [[ "$but" -ne 4 ]]
do
case "$but" in
1)
nano
;;
2)
vi
;;
3)
links
;;
esac
read but
done
exit 0


