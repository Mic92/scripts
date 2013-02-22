#!/bin/bash

if [ "$(pidof firefox)" ] && [ "$(pgrep thunderbird)" ]
then
    echo Please close all instance of firefox and thunderbird to unlock the database >&2
		exit 1
else
	  echo Database optimization begin ...
		echo -------------------------------
    time for i in `find ~/.thunderbird ~/.mozilla -name \*.sqlite`
    do
    before=`du $i -h | cut -f 1`
    sqlite3 $i 'VACUUM;'
    sqlite3 $i 'REINDEX;'
    after=`du $i -h | cut -f 1`
		file=$(basename $i)
		[ $before !=  $after ] && echo $file: $before - $after || echo $file: No change $before
    done
fi
