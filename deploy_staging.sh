#!/bin/bash
set -ex


ssh 52.68.225.208 "cd /var/www/www.fc-hikaku.net/rails; git reset --hard HEAD; git checkout staging; git pull; bundle install; bundle exec rake assets:clean RAILS_ENV=staging; bundle exec rake assets:precompile RAILS_ENV=staging; bundle exec rake db:migrate RAILS_ENV=staging; rake unicorn:stop; rake unicorn:start; exit 0"


# cd /var/www/www.fc-hikaku.net/rails
# git reset --hard HEAD
# git checkout staging
# git pull
# bundle install
# bundle exec rake assets:clean RAILS_ENV=staging
# bundle exec rake assets:precompile RAILS_ENV=staging
# bundle exec rake db:migrate RAILS_ENV=staging
# rake unicorn:stop
# rake unicorn:start