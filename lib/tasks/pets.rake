namespace :pet do
  desc 'get rescue group '
  task :rescuegroup => :environment do
    (1..100).each do |page|
      Runner.run_rescue_group(page)
    end
  end

  task :petfinder => :environment do
    Runner.run_petfinder
  end
end
