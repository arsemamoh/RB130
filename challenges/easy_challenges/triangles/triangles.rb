=begin 
- we are given three integers to represent the three sides of a Triangle
- these three integers must all be greater than 0
- the sum of any two sides must be greater than the third

Data structures
- integer 
- String

Algorithm
- create a Triangle Class
- the constructor method takes three arguments - all integers
  - check is the arguments are valid sides 
  - if so initialize an instance variable @sides to an array containing the values as elements
- define a private instance method valid_sides?
  - takes three arguments
  - check if all arguments are greater than 0 else raise ArgumentError
  - check if the sum of any two sides is greater than the third else raise ArgumentError
=end

require 'minitest/autorun'
# require_relative 'triangles'

class Triangle
  attr_reader :sides

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3] if valid_sides?(side1, side2, side3)
  end

  def kind
    case sides.uniq.size
    when 3
      return 'scalene'
    when 2
      return 'isosceles'
    when 1
      return 'equilateral'
    end
  end

  private

  def valid_sides?(side1, side2, side3)
    raise ArgumentError unless [side1, side2, side3].all?{ |side| side > 0 }

    if (side1 + side2) <= side3
      raise ArgumentError
    elsif (side2 + side3) <= side1
      raise ArgumentError
    elsif (side1 + side3) <= side2
      raise ArgumentError
    end

    true
  end
end