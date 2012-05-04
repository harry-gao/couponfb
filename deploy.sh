#!/bin/sh

if [ "$#" -ne 1 ]
   then echo "useage $0 'comments to git'"
   exit 1
fi



git add .
echo git commit -m \"$1\"
git commit  -m \"$1\" 

#git push origin master
#cap deploy:update
