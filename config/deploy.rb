set :application, "mystore"
set :domain, "68.195.138.40"
set :user, "ezwebgur"
set :password, "xsw23edc"
set :scm_username, "gourab"
set :rails_env, "production"
set :scm, :git
set :repository, "git@github.com:gourab/mystore.git"
set :deploy_to, "/home/ezwebgur/apps/#{application}"
set :use_sudo, false
set :chmod755, "app config db lib vendor public assets script script/*"
#set :chmod755, "app config db lib public vendor script script/* public/disp*"
set :keep_releases, "5" # number of deployed releases to keep
# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"
#set whenever --update-crontab tuthat --set environment=production
# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion
default_run_options[:pty] = true
ssh_options[:keys] = %w(~/.ssh/id_rsa)
ssh_options[:forward_agent] = true
role :app, domain
role :web, domain
role :db,  domain, :primary => true
namespace :deploy do
  task :restart, :roles => :app do
    run "cp #{current_path}/config/example.database.yml #{current_path}/config/database.yml"
    run "cd #{current_path} && chmod 755 #{chmod755}"
    run "cd #{current_path} && bundle install --path vendor/bundle"
    run "touch #{current_path}/tmp/restart.txt"
  end
end
after :deploy, "deploy:restart"
#after "deploy:symlink"#, "deploy:update_crontab"
#namespace :deploy do
#  desc "Update the crontab file"
#  task :update_crontab, :roles => :db do
#    run "cd #{release_path} && whenever --update-crontab #{application} --set environment=#{rails_env}"
#  end
#end

