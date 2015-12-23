require 'nokogiri'
require 'httparty'
require 'pry'


class CraigslistUrlGetter
  class << self

    CL_URL = "https://tampa.craigslist.org/search/cto"

    def get_links(url = CL_URL)
      puts "started getting links"
      response = HTTParty.get(CL_URL)
      puts "got a response"
      rows = Nokogiri::HTML(response).css(".row")
      rows.map do |row|
        hdrlnk = row.css(".hdrlnk").first
        href = merge_base_url_with_car_href(hdrlnk.attributes["href"].value)
        title_text = hdrlnk.inner_text
        cl_price = row.css(".price").text.match(/\d+/).to_s.to_i
        cl_pid = row.attributes["data-pid"].value
        next if row.attributes["data-repost-of"]
        {href: href, title_text:title_text, cl_price: cl_price, cl_pid: cl_pid}  
      end.reject(&:nil?)
    end

    def merge_base_url_with_car_href(car_href)
      car_href = car_href
      base_url = CL_URL.gsub("/cto", "").gsub("/search", "")
      base_url + car_href
    end

    def turn_links_into_cars(links_array)
      links_array.each do |link|
        begin
          if Car.where(cl_pid: link[:cl_pid]).empty?
            this_car = Car.new(link)
            this_scraper = CraigslistFieldScraper.new(this_car.href)
            scrape_this_car(car: this_car, scraper: this_scraper)
            this_car.save!
          end
        rescue NoMethodError => e
          Rails.logger.warn e.inspect
          if Car.where(cl_pid: link[:cl_pid]).empty?
            this_car = Car.new(link)
            this_car.hidden = true
            this_car.save!              
          end          
        end
      end
    end

    def scrape_this_car(args)
      car = args[:car]
      scraper = args[:scraper]
      car.cl_ymm = scraper.scrape_ymm
      CraigslistCarProcessor.process_ymm(car) # car now has ed make, model, and year
      RushPricer.min_price(car)
    end
  end
end