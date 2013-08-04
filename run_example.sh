bundle install
bundle exec cap berks
bundle exec cap vrails4 vg:up
bundle exec cap vrails4 bootstrap
bundle exec cap vrails4 chef
