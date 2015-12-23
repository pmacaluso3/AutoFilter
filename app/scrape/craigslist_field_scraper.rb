require 'httparty'
require 'nokogiri'

class CraigslistFieldScraper
  attr_accessor :response, :url

  def initialize(url)
    @url = url
    @response = scrape
  end

  def scrape
    Nokogiri::HTML(HTTParty.get(url))
  end

  def scrape_ymm
    response.css('.attrgroup').first.text
  end

  def scrape_options
    options = response.css('.attrgroup')[1].children.map{ |c| c.text }.reject{ |c| c == "" }
    options_hash = {}
    options.each do |option|
      pair = option.split(": ")
      options_hash[pair.first] = pair.last
    end
    options_hash
  end
end

