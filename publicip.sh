#!/bin/sh
# eigene öffentliche ip anzeigen

curl --silent http://checkip.dyndns.org/ | egrep -o -m1 '[[:digit:]]{1,3}(\.[[:digit:]]{1,3}){3}'
