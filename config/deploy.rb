require "rvm/capistrano"
require "bundler/capistrano"
require "capistrano_colors"

load "config/recipes/base"
load "config/recipes/nginx"
load "config/recipes/unicorn"
load "config/recipes/postgresql"
load "config/recipes/misc"

set :host, "176.58.108.251"
server host, :web, :app, :db, primary: true

desc "Run tasks in staging enviroment."
task :staging do
  set :application, "tutti.staging"
  set :branch, "master"
  set :nginx_server_names, "tuttifruttirussia.stage.grow.bi"
end

desc "Run tasks in production enviroment."
task :production do
  set :application, "tutti"
  set :branch, "master"
  set :nginx_server_names, "tuttifruttirussia.com www.tuttifruttirussia.com"
end

set :user, "root"
set :deploy_to, -> { "/srv/#{application}" }
#set :deploy_via, :remote_cache
set :use_sudo, false
default_run_options[:pty] = true

set :scm, "git"
set :repository, "git@github.com:Ajaxy/TuttiFrutti.git"

set :rvm_type, :system
set :rvm_ruby_string, "ruby-1.9.3-p286"

set :postgresql_password, "111"

ssh_options[:forward_agent] = true