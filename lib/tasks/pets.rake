namespace :pet do
  desc 'get rescue group '
  task :rescuegroup => :environment do
    (1..100).each do |page|
      Delayed::Job.enqueue(Runner.new(:run_rescue_group,page))
    end
  end

  task :petfinder => :environment do
    Delayed::Job.enqueue(Runner.new(:run_petfinder))
  end
end
