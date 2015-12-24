require 'json'
require 'httparty'

class CraigslistCarProcessor
  def self.process_year(ymm_array)
    ymm_array.select{ |y| y.match(/\d{4}/) }.select{ |y| y.to_i <= Time.now.year && y.to_i >= 1970 }.first.to_i
  end

  def self.process_ymm(car)
    sm = StringMatcher.new
    ymm_array = car.cl_ymm.split(" ")
    
    makes = EdmundsMake.all
    chosen_make = sm.match_from_test_array_against_reference_array(test_array: ymm_array, reference_array: makes.map(&:name).map(&:downcase))
    chosen_ed_make = makes.where(name: chosen_make.capitalize).first

    models = chosen_ed_make.edmunds_models
    chosen_model = sm.match_from_test_array_against_reference_array(test_array: ymm_array, reference_array: models.map(&:name).map(&:downcase))
    chosen_ed_model = models.where(name: chosen_model.capitalize).first

    years = chosen_ed_model.edmunds_years
    chosen_ed_year = years.select{ |y| y.year == process_year(ymm_array) }.first

    car.edmunds_make = chosen_ed_make
    car.edmunds_model = chosen_ed_model
    car.edmunds_year = chosen_ed_year
  end

  def process_cl_options(car)
    scrape_options = CraigslistFieldScraper.new(car.href).scrape_options
  end

  def process_options(car)
    make = car.ed_make.nice_name
    model = car.ed_model.nice_name
    year = car.ed_year.year
    query_string = "https://api.edmunds.com/api/vehicle/v2/#{make}/#{model}/#{year}/styles?fmt=json&view=full&api_key=#{ENV['edmunds_key']}"
    response_hash = HTTParty.get(query_string)
    styles = response_hash["styles"]
    styles.each do |style|
      
    end
  end
end