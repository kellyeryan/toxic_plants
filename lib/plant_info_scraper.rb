# frozen_string_literal: true

# This is responsible for scraping my web page.
# This file will use nokogiri, i.e. scrape.
# It will never use puts.

class PlantInfoScraper
  def initialize(plant)
    unparsed_page = HTTParty.get("https://www.aspca.org#{plant.url}")
    parsed_page = Nokogiri::HTML(unparsed_page)

    additional_common_names = parsed_page.css("div.pane-node-field-additional-common-names span.values").text

    scientific_name = parsed_page.css("div.pane-node-field-scientific-name span.values").text

    clinical_signs = parsed_page.css("div.pane-node-field-clinical-signs span.values").text

  end
end
