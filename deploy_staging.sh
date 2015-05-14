#!/bin/sh
set -ex


export AWS_DEFAULT_REGION="ap-northeast-1"

MYSECURITYGROUP="sg-4a6afa2f"
MYIP=`curl -s ifconfig.me`

aws ec2 authorize-security-group-ingress --group-id $MYSECURITYGROUP --protocol tcp --port 22 --cidr $MYIP/32


ssh 52.68.225.208 << EOF

source ~/.bash_profile

cd /var/www/www.fc-hikaku.net/rails

git reset --hard HEAD
git checkout staging
git pull

bundle install

bundle exec rake assets:clean RAILS_ENV=staging
echo "rake assets:clean"
bundle exec rake assets:precompile RAILS_ENV=staging
echo "rake assets:precompile"
bundle exec rake db:migrate RAILS_ENV=staging
echo "rake db:migrate"

rake unicorn:stop
rake unicorn:start

exit 0

EOF


aws ec2 revoke-security-group-ingress --group-id $MYSECURITYGROUP --protocol tcp --port 22 --cidr $MYIP/32