#!/bin/bash
awk '{$3="(WW)"; print}' ~/.local/share/xorg/Xorg.0.log | sed 's/(WW)/Warning/g' > full.log
awk '{$3="(II)"; print}' ~/.local/share/xorg/Xorg.0.log | sed 's/(II)/Information/g' >> full.log
cat full.log

