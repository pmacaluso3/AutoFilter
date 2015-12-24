require 'httparty'
require 'json'

module EdmundsPopulator
  def populate!(hash = nil)
    hash = fetch_makes_data unless hash
    hash["makes"].each do |make|
      this_make = EdmundsMake.create(name: make["name"], nice_name: make["niceName"])
      make["models"].each do |model|
        this_model = this_make.edmunds_models.create(name: model["name"], nice_name: model["niceName"])
        model["years"].each do |year|
          this_model.edmunds_years.create(year: year["year"].to_i)
        end
        this_model.save
      end
      this_make.save
    end
  end

  def fetch_makes_data
    s = "https://api.edmunds.com/api/vehicle/v2/makes?fmt=json&api_key=#{ENV['edmunds_key']}"
    response = HTTParty.get(s)
    JSON.parse(response)
  end
end