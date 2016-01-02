namespace :constantly do
  task :update => :environment do
    links = CraigslistUrlGetter.get_links
    CraigslistUrlGetter.turn_links_into_cars(links)    
  end

  task :cull => :environment do
    Car.hidden.destroy_all
  end
end