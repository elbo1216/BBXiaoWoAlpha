namespace :deploy do

  desc "Rake tasks"
  task :rake_task do
    on roles(:web) do
      execute "cd /opt/BBXiaoWo/current && rake db:migrate"
    end
  end

  desc "Makes sure local git is in sync with remote."
  task :check_revision do
    unless `git rev-parse HEAD` == `git rev-parse origin/master`
      puts "WARNING: HEAD is not the same as origin/master"
      puts "Run `git push` to sync changes."
      exit
    end
  end

  desc "After deploy tasks"
  task :post_deploy_tasks do
    invoke "deploy:rake_task"
    invoke "deploy:restart"
    invoke "deploy:cleanup"
  end

  %w[start stop restart].each do |command|
    desc "#{command} Nginx/Passenger server."
    task command do
      on roles(:app) do
        execute "sudo service nginx #{command}"
      end
    end
  end

  before :deploy, "deploy:check_revision"
  after :deploy, "deploy:post_deploy_tasks"
  after :rollback, "deploy:restart"
end
