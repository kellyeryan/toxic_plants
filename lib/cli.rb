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
    " toxic to cats and provide the clinical signs of poisoning.\n\n"
  end

  def self.find_plants_by_letter
    puts "What is the first letter of the plant you would like to look up?"
    letter = gets.chomp
    exit_session(letter)
    return unless letter_valid?(letter)

    PlantsScraper.new(letter).create_plants
    Plant.all.each do |plant|
      puts "#{plant.id}. #{plant.common_name}"
    end
    puts ""
  end

  def self.letter_valid?(letter)
    return true if /[abcdefghijklmnoprstuvwy]/.match?(letter)

    puts "Please put in a letter from A-Z." \
         "There are no plants that start with Q, X, or Z. Try again.\n\n"
    find_plants_by_letter
    false
  end

  def self.find_plants_by_id
    puts "What is the number of the plant you would like to look up?"
    id = gets.chomp
    exit_session(id)
    return unless id_valid?(id.to_i)

    plant = Plant.find_by_id(id)
    PlantInfoScraper.new(plant)
    list_plant_info(plant)
  end

  def self.id_valid?(id)
    return true unless id > Plant.all.length || id <= 0

    puts "That is not a valid entry. Please enter" \
         " the number corresponding to the plant you would like to look up. \n\n"
    find_plants_by_id
    false
  end

  def self.list_plant_info(plant)
    puts ""
    puts "Additional names:#{plant.additional_common_names}\n\n"
    puts "Scientific name:#{plant.scientific_name}\n\n"
    puts "These are the symptoms that occur when a cat eats #{plant.common_name.downcase}."
    puts plant.clinical_signs
  end

  def self.exit_session(id = nil, letter = nil)
    return unless letter == "exit" || id == "exit"

    puts "Thanks for using Toxic Plants! Goodbye!\n\n"
    exit
  end
end
