# StandarizedDeploy

Capistrano scripts for use with my rails app stack.

It uses capistrano multistage.

## Installation

Add this line to your application's Gemfile:

    gem 'standarized_deploy', git: 'git://github.com/jumski/standarized_deploy.git', branch: 'multistage'

And then execute:

    $ bundle

## Usage

Capify your project as usual

    capify .

Replace config/deploy.rb with following contents (based on multistage extension):

```ruby
set :stages, %w(production staging)
set :default_stage, "staging"
require 'capistrano/ext/multistage'

set :application, "capistrano-multistage-test"
set :user, "www-data"
set :group, "www-data"

set :scm, :git
set :repository, "ssh://ourserver/#{application}.git"
set :deploy_to, "/var/www/#{application}"
set :deploy_via, :remote_cache
set :rails_env, 'production'
```

In your config/deploy/stage_name.rb (eg: config/deploy/staging.rb) put following code:

```ruby
set :app_name, 'foo' # standarized_stack app_name
set :app_domain, 'foo.bar.com'
set :rails_env, :staging # defaults to production
require 'standarized_deploy/defaults'
```

Replace staging with production if needed.

You can also use both.

Now you can deploy to standarized_stack staging env like this:

  cap staging deploy

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
