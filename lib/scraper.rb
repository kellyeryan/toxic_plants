# frozen_string_literal: true

# This is responsible for scraping my web page.
# This file will use nokogiri, i.e. scrape.
# It will never use puts.
# After scraping it will need to create "plants."

# basic web page of plants toxic to cats: https://www.aspca.org/pet-care/animal-poison-control/toxic-and-non-toxic-plants?field_toxicity_value%5B%5D=02

# web page of plants toxic to cats with alphabet search https://www.aspca.org/pet-care/animal-poison-control/toxic-and-non-toxic-plants/k?field_toxicity_value%5B02%5D=02&

require "byebug"

class Scraper
  def initialize
    url = "https://www.aspca.org/pet-care/animal-poison-control/toxic-and-non-toxic-plants?field_toxicity_value%5B%5D=02"
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    plant_names = parsed_page.css("div.plant-title-name")
    url_for_plants = parsed_page.css("span").css("a")[4].attributes["href"].value
    find_url = parsed_page.css("span").css("a")
      # it spans on the page from [3-32]; each plant has two indices that link to the same place, i.e. both [3] and [4] are adam-and-eve plant- could just take odd or even numbers? Or maybe it doesn't matter at all?? How will I make sure they are linked?

    find_url_2 = find_url.map(&:attributes["href"])

    plant_array = plant_names.map { |plant| plant.text }
      #plant_array puts common name then latin name -- evens are common name, odds are latin name
      byebug

  end
end
