#!/bin/sh

if [ "$#" -ne 1 ]
   then echo "useage $0 'comments to git'"
   exit 1
fi

ssh-add ~/.ssh/ec2_ubuntu.pem
bundle exec rake assets:precompile

git add .
echo git commit -m "\"$1\""
git commit -a -m "\"$1\""

git push origin master
cap deploy:update
cap deploy:restart
