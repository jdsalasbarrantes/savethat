# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "savethat"
set :repo_url, "https://github.com/jdsalasbarrantes/savethat.git"
set :rvm_ruby_version, "2.5.1"

set :linked_files, %w{config/master.key}

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')