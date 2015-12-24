namespace :constantly do
  task :update => :environment do
    links = CraigslistUrlGetter.get_links
    CraigslistUrlGetter.turn_links_into_cars(links)    
  end
end