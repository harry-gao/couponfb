set :application, "couponfb"
set :repository,  "https://github.com/foxgaocn/couponfb"

set :scm, :git

set :ssh_options, {:forward_agent => true}
set :use_sudo, false
set :deploy_to, "/home/ubuntu/coupondb"
set :user, "ubuntu"

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "107.22.165.87"                          # Your HTTP server, Apache/etc
role :app, "107.22.165.87"                          # This may be the same as your `Web` server
role :db,  "107.22.165.87", :primary => true # This is where Rails migrations will run


# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end