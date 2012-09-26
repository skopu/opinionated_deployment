# StandarizedDeploy

Capistrano scripts for use with my rails app stack.

## Installation

Add this line to your application's Gemfile:

    gem 'standarized_deploy', git: 'git://github.com/jumski/standarized_deploy.git'

And then execute:

    $ bundle

## Usage

Capify your project as usual

    capify .

In your config/deploy.rb specify values:

```ruby
set :staging_app_key, 'foo'
set :staging_app_domain, 'foo.bar.com'
require 'standarized_deploy/staging'
```

Replace staging with production if needed.

You can also use both.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
