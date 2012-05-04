#!/bin/sh

if [ "$#" -ne 1 ]
   then echo "useage $0 'comments to git'"
   exit 1
fi


#bundle exec rake assets:precompile

#git add .
#echo git commit -m "\"$1\""
git commit -a -m "\"$1\""

#git push origin master
#cap deploy:update
