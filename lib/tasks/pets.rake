namespace :pet do
  desc 'get rescue group '
  task :rescuegroup => :environment do
    Runner.run_rescue_group
  end
end
