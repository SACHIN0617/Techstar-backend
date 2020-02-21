# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :rvm_ruby_version, '2.6.3'
set :application, "techstar-api"
set :repo_url, 'git@github.com:SACHIN0617/Techstar-backend.git'
set :branch, ENV['BRANCH'] || `git rev-parse --abbrev-ref HEAD`.chomp

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/sockets', "tmp/sockets")
set :linked_files, fetch(:linked_files, []).push('config/master.key', 'config/database.yml', "config/credentials.yml.enc")

set :deploy_to, "/home/ubuntu/techstar-api"


