namespace :constantly do
  task :update => :environment do
    links = CraigslistUrlGetter.get_links
    CraigslistUrlGetter.turn_links_into_cars(links)    
  end

  task :cull => :environment do
    Car.hidden.destroy_all
    Car.visible.select do |car|
      (car.created_at < Time.now - 7.days) || (car.ed_price - car.cl_price < 1000)
    end.destroy_all
  end
end