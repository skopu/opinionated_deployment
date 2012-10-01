# Opinionated Deployment

Capistrano scripts for use with my rails app stack.

It uses capistrano multistage.

## It is opinionated

This gem assumes that:

* you use opinionated_stack (work in progress)
* you use git
* you have stages (staging, production etc.)

## Installation

Add this line to your application's Gemfile:

    gem 'opinionated_deployment', git: 'git://github.com/jumski/opinionated_deployment.git'

And then execute:

    $ bundle

## Usage

Capify your project as usual

    capify .

Replace config/deploy.rb with following contents:

```ruby
set :stages, %w(production staging)
set :default_stage, "staging"
require 'capistrano/ext/multistage'

set :repository, "ssh://ourserver/#{application}.git"
```

In your config/deploy/staging.rb put following code:

```ruby
set :app_name, 'foo' # opinionated_stack 'app_name'
set :app_domain, 'foo.bar.com'
set :rails_env, :staging # defaults to production
require 'opinionated_deployment/defaults'

# you can override all defaults here !
```

Replace staging with production or any other stage name if needed.

You can also use both.

Now you can deploy to opinionated_stack:

  cap staging deploy

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
