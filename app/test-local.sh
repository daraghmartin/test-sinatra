eval "$(/opt/chefdk/bin/chef shell-init bash)"
bundle install
rspec test-rspec.rb
