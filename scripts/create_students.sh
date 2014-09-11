#!/bin/bash

if [ ! -d "~/.ssh" ]; then
	mkdir ~/.ssh
	chmod 0700 ~/.ssh
fi

ssh-keygen -f ~/.ssh/student_key -N ""

for i in `seq 16 25`;
do
	useradd -m student$i
	chsh -s /bin/bash student$i
	mkdir /home/student$i/.ssh
	touch /home/student$i/.ssh/authorized_keys
	chmod 0700 /home/student$i/.ssh
	chmod 0400 /home/student$i/.ssh/authorized_keys
	chown -R student$i:student$i /home/student$i/.ssh
	cat ~/.ssh/student_key.pub > /home/student$i/.ssh/authorized_keys
	echo "student$i    ALL=(ALL)   NOPASSWD: ALL" >> /etc/sudoers
done

cat ~/.ssh/student_key
