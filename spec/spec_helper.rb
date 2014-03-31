# SimpleCov Settings
begin
  require 'simplecov'
  SimpleCov.start
rescue LoadError
  puts 'Coverage disabled, enable by installing simplecov'
end

# source
require_relative '../lib/roman_numbers'

# gems used
require 'rspec'
require 'awesome_print'
