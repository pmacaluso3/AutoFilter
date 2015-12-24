namespace :populate do
  task :edmunds => :environment do
    EdmundsPopulator.populate!
  end
end