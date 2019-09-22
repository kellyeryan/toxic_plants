# frozen_string_literal: true

# This class is responsible for communicating with the user.
# It will never use nokogiri and it is the only place that will use puts.
# It will have to invoke scraper

class Cli
  def self.call
    welcome
    find_plants_by_letter
    find_plants_by_id
  end

  def self.welcome
    puts "Welcome to Toxic Plants!"
    puts "This program will find plants that are toxic to cats."
  end

  def self.find_plants_by_letter
    puts "What is the first letter of the plant you would like to look up?"
    letter = gets.chomp
    PlantsScraper.new(letter).create_plants

    Plant.all.each do |plant|
      puts "#{plant.id}. #{plant.common_name}"
    end
    puts ""
  end

  def self.find_plants_by_id
    puts "What is the number of the plant you would like to look up?"
    id = gets.chomp
    if id.to_i > Plant.all.length
      puts "That is not a valid number.\n\n"
      find_plants_by_id
    else
      plant = Plant.find_by_id(id)
      PlantInfoScraper.new(plant)
      list_plant_info(plant)
    end
  end

  def self.list_plant_info(plant)
    puts ""
    puts "Additional names:#{plant.additional_common_names}\n\n"
    puts "Scientific name:#{plant.scientific_name}\n\n"
    puts "These are the symptoms that occur when the cat eats #{plant.common_name.downcase}."
    puts plant.clinical_signs
  end
end

# What if the user puts in invalid input--more than one letter,
# a number instead of a letter (or vv), a symbol instead of a number or letter,
# a number that isn't listed...? How do I deal with plants that
# don't have additional common names?
# What if user chooses a number that is too high or low?
