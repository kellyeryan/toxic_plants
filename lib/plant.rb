# frozen_string_literal: true

# This is responsible for the blueprint of plant objects
# It will never use nokogiri
# It will never use puts.
# Stores all plant related info.

class Plant
  attr_accessor :common_name, :additional_common_name, :scientific_name, :clinical_signs
end
