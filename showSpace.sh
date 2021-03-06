#!/bin/bash

## print out the line that shows hpctmp2 space

count=1
lastNum=6

filename='hpctmp2space'
filename+=$(date +%Y%m%d%H%M%S)
filename+='.txt'

echo
echo $filename has been created...
echo

while :
do hpc space | sed -n '14p' >> $filename
hpc space | sed -n '14p'

for ((j=count;j<=lastNum;j++))
do printf ' '
done

for ((j=1;j<=(2*count-1);j++))
do printf '.'
done

printf '\n'

if [ $count -lt $lastNum ]
then count=$((count+1))
else count=1
fi

sleep 1

done
