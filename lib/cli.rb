# frozen_string_literal: true

# This class is responsible for communicating with the user.
# It will never use nokogiri and it is the only place that will use puts.
# It will have to invoke scraper

class Cli

  def self.call
    puts "Welcome to Toxic Plants!"
    puts "This program will find plants that are toxic to cats"
    puts "What is the first letter of the plant you'd like to look up?"
    input = gets.chomp
    Scraper.new(input)
    Plant.all.each_with_index do |plant, index|
      puts "#{index + 1}. #{plant.common_name}"
    end
    puts "What is the number of the plant you would like to look up?"
    input = gets.chomp
  end

end
