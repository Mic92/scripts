#!/bin/sh
unread=`curl -s -u "yourname@gmail.com:secret-password"  -X GET https://mail.google.com/mail/feed/atom | sed -ne 's/.*<fullcount>\(.*\)<\/fullcount>.*/\1/p' 2> /dev/null`
echo You have $unread mails.
