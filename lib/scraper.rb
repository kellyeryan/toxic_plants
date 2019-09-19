# frozen_string_literal: true

require "httparty"
require "nokogiri"
require "pry"


# This is responsible for scraping my web page.
# This file will use nokogiri, i.e. scrape.
# It will never use puts.
# After scraping it will need to create "plants."

# basic web page of plants toxic to cats: https://www.aspca.org/pet-care/animal-poison-control/toxic-and-non-toxic-plants?field_toxicity_value%5B%5D=02

# web page of plants toxic to cats with alphabet search https://www.aspca.org/pet-care/animal-poison-control/toxic-and-non-toxic-plants/k?field_toxicity_value%5B02%5D=02&

require "byebug"

class Scraper

  attr_accessor :common_name, :additional_common_name, :scientific_name, :clinical_signs

  url = "https://www.aspca.org/pet-care/animal-poison-control/toxic-and-non-toxic-plants/"

  unparsed_page = HTTParty.get(url)

  parsed_page = Nokogiri::HTML(unparsed_page)

  plant_names = parsed_page.css("div.plant-title-name")


  # are you looking for plants toxic to dogs, cats, or horses?

  # dog_list = parsed_page.css("span").css("a")[0].attributes["href"].value
  # cat_list = parsed_page.css("span").css("a")[1].attributes["href"].value
  # horse_list = parsed_page.css("span").css("a")[2].attributes["href"].value



  byebug

end
