# frozen_string_literal: true

# This class is responsible for communicating with the user.
# It will never use nokogiri and it is the only place that will use puts.
# It will have to invoke scraper

class Cli
  def self.call
    welcome
    find_plants_by_letter
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

  def self.welcome
    puts "Welcome to Toxic Plants!"
    puts "This program will find plants that are toxic to cats."
  end

  def self.find_plants_by_letter
    puts "What is the first letter of the plant you'd like to look up?"
    letter = gets.chomp
    PlantsScraper.new(letter).create_plants
    Plant.all.each do |plant|
      puts "#{plant.id}. #{plant.common_name}"
    end
  end
end

# What if the user puts in invalid input--more than one letter,
# a number instead of a letter (or vv), a symbol instead of a number or letter,
# a number that isn't listed...? How do I deal with plants that
# don't have additional common names?
