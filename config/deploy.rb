lock '~> 3.17.2'

set :application, 'video_sharer_api'
set :repo_url, 'git@github.com:trungquan31/video-shareder-BE.git'
set :keep_releases, 2
set :rbenv_path, '/home/quan/.rbenv'
set :pty, true

append :linked_dirs, 'log', 'tmp/storage', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle'
append :linked_files, 'config/database.yml', 'config/application.yml'


