# frozen_string_literal: true

# This is responsible for scraping my web page.
# This file will use nokogiri, i.e. scrape.
# It will never use puts.

class PlantInfoScraper
  attr_reader :parsed_page

  def initialize(plant)
    unparsed_page = HTTParty.get("https://www.aspca.org#{plant.url}")
    @parsed_page = Nokogiri::HTML(unparsed_page)

    plant.update_attributes(
      additional_common_names: get_info("additional-common-names"),
      scientific_name: get_info("scientific-name"),
      clinical_signs: get_info("clinical-signs")
    )
  end

private

  def get_info(selector)
    @parsed_page.css("div.pane-node-field-#{selector} span.values").text
  end
end
