# Sometimes it can be important to shut down the xen-vms quickly and with only one command. this is what this script is for.
#!/bin/bash

# choose shutdown or destroy
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

domains=`xl list | cut -f1 -d" " | egrep -v "Name|Domain-0"`

for i in $domains ; do
	xm $command $i
	sleep $timeout
done

