#!/bin/bash

studentCount=`ls /home | grep -c "student"`

for i in `seq 1 $studentCount`;
do
	deluser student$i
	rm -rf /home/student$i
done
