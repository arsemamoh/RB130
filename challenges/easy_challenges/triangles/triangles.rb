=begin
- we are given three numbers to represent the three sides of a triangle
- we must determine what type of triangle it is
- all given values must be greater than zero
- the sum of any two values must be greater than the thrid one

Algorithm
- define a class Trianle that takes 3 arguments in its constructor
- define the initialize method with 3 args
  - checks is the arugments represent a valid triangle, if so initialize an instance variable sides - an array     with the values as elements
  - else return value returned by valid_triangle?
- define a helper method valid_triangle?
  - takes three arguments
  - check if any of the arguments are less than 1, if so return ArgumentError
  - check if the sum of two values is greater less than the third if so return ArgumentError
    - 
- define an instance method kind 
  - if the values is instance variable @sides has all three different values return - scalene
  - if values have two equal values return - isosceles
  - if values have all 3 equal sides return 0 equilateral
  
=end

class Triangle
  attr_reader :sides
  
  def initialize(side1, side2, side3)
    if valid_triangle?(side1, side2, side3) 
      @sides = [side1, side2, side3]
    else
      raise ArgumentError.new
    end
  end
  
  def kind
    if sides.uniq.size == 3 
      "scalene"
    elsif sides.uniq.size == 2
        "isosceles"
    elsif sides.uniq.size == 1
        "equilateral"
    end
  end

  def valid_triangle?(side1, side2, side3)
    if [side1, side2, side3].any? {|side| side < 1} 
      return false 
    elsif side1 + side2 > side3
      return false
    elsif side2 + side3 > side1
      return false
    elsif side1 + side3 > side2
      return false
    end
    true
  end
end