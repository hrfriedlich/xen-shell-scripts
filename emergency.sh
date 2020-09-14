#! /bin/bash

case $1 in
	shutdown)
	command=shutdown
	timeout=5
	;;
	destroy)
	command=destroy
	timeout=1
	;;
	*)
	exit
	;;
esac

domains=`xm list | cut -f1 -d" " | egrep -v "Name|Domain-0"`

for i in $domains ; do
	xm $command $i
	sleep $timeout
done

