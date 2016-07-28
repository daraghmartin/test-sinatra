eval "$(/opt/chefdk/bin/chef shell-init bash)"
/opt/chefdk/embedded/bin/bundle install
/opt/chefdk/embedded/bin/ruby app.rb
