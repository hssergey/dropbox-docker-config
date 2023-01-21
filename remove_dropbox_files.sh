#!/bin/sh
cd /tmp
/usr/bin/find . -path "./.dropbox-dist-new-*" -mtime +1 -prune -exec rm -rf "{}" \;
/usr/bin/find . -path "./dropbox-antifreeze*" -mtime +1 -delete


