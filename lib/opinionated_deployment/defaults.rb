
require 'opinionated_deployment/common'

configuration = Capistrano::Configuration.respond_to?(:instance) ?
  Capistrano::Configuration.instance(:must_exist) :
  Capistrano.configuration(:must_exist)

configuration.load do
  _cset(:app_name) do
    abort "Please specify :app_name corresponding to your server, set :app_name, 'foo'"
  end

  _cset(:app_domain) do
    abort "Please specify :app_domain corresponding to your server, set :app_domain, 'foo.bar.com'"
  end

  _cset(:restart_workers)   { false }
  _cset(:clear_redis_cache) { false }

  ssh_options[:forward_agent] = true
  set :rvm_ruby_string, 'default'
  set :scm, :git
  set :scm_verbose, true
  set :git_enable_submodules, 1
  set :deploy_via, :remote_cache
  set :use_sudo, false
  set :application, app_domain
  role :app, app_domain
  role :web, app_domain
  role :db, app_domain, :primary => true
  default_environment['LANG']     = 'en_US.UTF-8'
  default_environment['LANGUAGE'] = 'en_US'
  default_environment['LC_ALL']   = 'en_US.UTF-8'

  set :rvm_ruby_string, 'default'
  set :rvm_type, :system

  set :user, app_name
  set :deploy_to,  "/home/#{user}"

  set :branch do
    current_branch = %x[ git branch | grep ^* | awk {'print $2'} ].chomp

    branch = Capistrano::CLI.ui.ask "Branch to deploy (make sure to push the branch first): [#{current_branch}] "
    branch = current_branch if branch.empty?
    branch
  end

  namespace :deploy do
    task :start do
      run "#{deploy_to}/bin/start"
    end

    task :restart do
      run "#{deploy_to}/bin/restart"
    end
  end

  namespace :workers do
    %w(start stop restart).each do |action|
      task action do
        run "cd #{current_path}; #{deploy_to}/bin/workers #{action}"
      end
    end
  end

  desc "Symlinks the database.yml"
  task :symlink_db, :roles => :app do
    run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
  end

  if restart_workers
    after 'deploy', 'workers:restart'
  end

  if clear_redis_cache
    after 'deploy', 'redis_cache:clear'
  end

  after 'bundle:install', 'symlink_db'

end
