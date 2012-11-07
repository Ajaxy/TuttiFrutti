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
  set :branch, "deploy"
  set :nginx_server_names, "tuttifruttirussia.com"
end

set :user, "root"
set :deploy_to, -> { "/srv/#{application}" }
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:AndreyM/TuttiFrutti.git"

set :rvm_type, :system

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :postgresql_password, "111"
