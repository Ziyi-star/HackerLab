#!/bin/bash

MYNAME=$(whoami)

cd /var/spool/$MYNAME

for i in * .*;
do
    if [ "$i" != "." -a "$i" != ".." ];
    then
        echo "Handling $i"
        OWNER=$(stat --format "%U" ./$i)
        echo "Owner of $i is $OWNER"
        if [ "${OWNER}" = "alien18" ]; then
            echo "Would run: timeout -s 9 1 ./$i"
            # timeout -s 9 1 ./$i
        fi
        echo "Would run: rm -f ./$i"
        # rm -f ./$i
    fi
done
