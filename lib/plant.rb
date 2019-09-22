# frozen_string_literal: true

# This is responsible for the blueprint of plant objects
# It will never use nokogiri
# It will never use puts.
# Stores all plant related info.

class Plant
  attr_reader :common_name, :additional_common_names, :scientific_name, :clinical_signs, :url, :id
  attr_writer :additional_common_names, :scientific_name, :clinical_signs

  @@all = []

  def initialize(common_name, url, id)
    @common_name = common_name
    @url = url
    @id = id
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_id(id)
    all.find do |plant|
      id.to_i == plant.id
    end
  end
end
