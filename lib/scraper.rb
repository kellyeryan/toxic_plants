# frozen_string_literal: true

# This is responsible for scraping my web page.
# This file will use nokogiri, i.e. scrape.
# It will never use puts.
# After scraping it will need to create "plants."

# basic web page of plants toxic to cats: https://www.aspca.org/pet-care/animal-poison-control/toxic-and-non-toxic-plants?field_toxicity_value%5B%5D=02

# web page of plants toxic to cats with alphabet search https://www.aspca.org/pet-care/animal-poison-control/toxic-and-non-toxic-plants/k?field_toxicity_value%5B02%5D=02&

require "byebug"

class Scraper
  def initialize(letter)
    url = "https://www.aspca.org/pet-care/animal-poison-control/toxic-and-non-toxic-plants" \
          "/#{letter}?field_toxicity_value%5B02%5D=02&"

    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)

    plant_info = parsed_page.css("div.views-field-title a")

    plant_info.each do |plant|
      common_name = plant.text
      url = plant.attributes["href"].value
      Plant.new(common_name, url)
    end
  end
end
