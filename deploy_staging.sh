#!/bin/bash
set -ex

#ssh 52.68.225.208 'touch test.txt'
#ssh 52.68.225.208 "cd /var/www/deploy_test; touch test.txt"
ssh 52.68.225.208 "cd /var/www/www.fc-hikaku.net/rails; git reset --hard HEAD; git pull; bundle install; rake unicorn:stop; rake unicorn:start;"


# cd /var/www/www.fc-hikaku.net/rails
# git reset --hard HEAD
# git pull
# bundle install
# rake unicorn:stop
# rake unicorn:start

# bundle exec rake assets:clean RAILS_ENV=aq_staging
# bundle exec rake assets:precompile RAILS_ENV=aq_staging
# bundle exec rake db:migrate RAILS_ENV=aq_staging

