require 'pry'

class RushPricer
  def self.min_price(car)
    begin
      make = car.edmunds_make.nice_name
      model = car.edmunds_model.nice_name
      year = car.edmunds_year.year
      query_string = "https://api.edmunds.com/api/vehicle/v2/#{make}/#{model}/#{year}/styles?fmt=json&view=full&api_key=#{ENV['edmunds_key']}"
      response_hash = HTTParty.get(query_string)
      prices = response_hash["styles"].map{ |s| s["price"]["usedTmvRetail"] }
      prices.min || nil
    rescue ArgumentError => e
      Rails.logger.warn("argument error while pricing: #{e})")
      return nil
    end
  end
end