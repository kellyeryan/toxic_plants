# frozen_string_literal: true

# This is responsible for scraping my web page.
# This file will use nokogiri, i.e. scrape.
# It will never use puts.
# After scraping it will need to create "plants."

class PlantsScraper
  attr_reader :parsed_page

  def initialize(letter)
    url = "https://www.aspca.org/pet-care/animal-poison-control/toxic-and-non-toxic-plants" \
          "/#{letter}?field_toxicity_value%5B02%5D=02&"
    unparsed_page = HTTParty.get(url)
    @parsed_page = Nokogiri::HTML(unparsed_page)
  end

  def create_plants
    plant_names.each_with_index do |plant, index|
      common_name = plant.text
      url = plant.attributes["href"].value
      id = index + 1
      Plant.new(common_name, url, id)
    end
  end

private

  def plant_names
    @parsed_page.css("div.views-field-title a")
  end
end
