=begin
- we are given an octal number and must convert it to a decimal number 
Data structures
- integers, array 
Algorithm 
- create Octal class with one arg in constructor
- define initialize method 
  - initialize instance variable @octal to an array of each character of the input as integer
- define to_decimal method
  - initialize a local variable decimal = 0
  - iterate through the octal array 
  - for each iteration with index
    - multiply the value by 8 to the power of the index 
    - increment decimal by that value 
  - return the decimal

=end

require 'minitest/autorun'
require 'pry'
# require_relative 'octal

class Octal
  attr_reader :octal

  def initialize(input)
    valid_input?(input) ? @octal = input.chars.map(&:to_i).reverse : @octal = [0]
  end

  def to_decimal
    decimal = 0
    octal.each_with_index do |digit, index|
      decimal += (digit * (8**index))
      # binding.pry
    end
    decimal
  end

  def valid_input?(input)
    input.chars.map(&:to_i).join == input && input.chars.any? {|char| char.to_i >= 8}
  end
end