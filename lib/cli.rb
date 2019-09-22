# frozen_string_literal: true

# This class is responsible for communicating with the user.
# It will never use nokogiri and it is the only place that will use puts.
# It will have to invoke scraper

class Cli

  def self.call
    puts "Welcome to Toxic Plants!"
    puts "This program will find plants that are toxic to cats"
    puts "What is the first letter of the plant you'd like to look up?"
    letter = gets.chomp
    PlantsScraper.new(letter)
    Plant.all.each do |plant|
      puts "#{plant.id}. #{plant.common_name}"
    end
    puts ""
    puts "What is the number of the plant you would like to look up?"
    id = gets.chomp
    plant = Plant.find_by_id(id)
    PlantInfoScraper.new(plant)
    puts ""
    puts "Additional names:#{plant.additional_common_names}"
    puts ""
    puts "Scientific name:#{plant.scientific_name}"
    puts ""
    puts "These are the symptoms that occur when the cat eats #{plant.common_name.downcase}."
    puts plant.clinical_signs
  end
end
