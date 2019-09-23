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
    puts "Welcome to Toxic Plants!\n\n"
    puts "This program will identify plants that are" \
    "toxic to cats and provide the clinical signs of poisoning.\n\n"
  end

  def self.find_plants_by_letter
    puts "What is the first letter of the plant you would like to look up?"
    letter = gets.chomp
    letter_valid?(letter)
    PlantsScraper.new(letter).create_plants
    Plant.all.each do |plant|
      puts "#{plant.id}. #{plant.common_name}"
    end
    puts ""
  end

  def self.letter_valid?(letter)
    unless /[abcdefghijklmnoprstuvwy]/.match?(letter)
      puts "Please put in a letter from A-Z." \
      "There are no plants that start with Q, X, or Z. Try again.\n\n"
      find_plants_by_letter
    end
  end

  def self.find_plants_by_id
    puts "What is the number of the plant you would like to look up?"
    id = gets.chomp
    if id.to_i > Plant.all.length || !/[1-9]/.match?(id)
      puts "That is not a valid entry.\n\n"
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
    puts "These are the symptoms that occur when a cat eats #{plant.common_name.downcase}."
    puts plant.clinical_signs
  end
end

# What if the user puts in invalid input--more than one letter,
# a number instead of a letter (or vv), a symbol instead of a number or letter,
# a number that isn't listed...? How do I deal with plants that
# don't have additional common names?
# What if user chooses a number that is too high or low?
