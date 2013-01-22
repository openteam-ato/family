source :rubygems

group :assets do
  gem 'coffee-rails'
  gem 'libv8',                  '~> 3.11.8' unless RUBY_PLATFORM =~ /freebsd/
  gem 'therubyracer',           :platforms => :ruby, :require => 'v8'
  gem 'uglifier'
end

group :default do
  gem 'attribute_normalizer'
  gem 'compass-rails'
  gem 'curb'
  gem 'el_vfs_client'
  gem 'enumerize'
  gem 'esp-commons'
  gem 'formtastic'
  gem 'hashie'
  gem 'inherited_resources'
  gem 'jquery-rails'
  gem 'kaminari'
  gem 'openteam-commons'
  gem 'paperclip-elvfs'
  gem 'rails'
  gem 'russian'
  gem 'sass-rails'
  gem 'simple_form'
  gem 'stop_ie'
  gem 'sunspot_rails'
  gem 'uuid'
end

group :development do
  gem 'hirb',                   :require => false
  gem 'quiet_assets'
  gem 'sqlite3',                :require => false
  gem 'sunspot_solr'
  gem 'thin',                   :require => false
end

group :production do
  gem 'pg',                     :require => false
end
