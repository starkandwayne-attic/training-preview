#!/bin/bash

studentCount=`ls /home | grep -c "student"`

for i in `seq 1 $studentCount`;
do
	echo -e "c1oudc0w\nc1oudc0w" | (passwd student$i)
done
