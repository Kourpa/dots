#!/bin/bash
#xdotool mousemove 561 257 click 3
for i in `seq 1 1000`;
do
    xdotool click 1 
    sleep $((1+(1000 + RANDOM % 10000)/10000))
    sleep $(((7000 + RANDOM % 10000)/10000))
    sleep $(((7000 + RANDOM % 10000)/10000))
done
