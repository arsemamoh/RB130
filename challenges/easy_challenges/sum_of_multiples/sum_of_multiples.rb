=begin
- we are given a natural number and one or more other numbers
- starting from 0 upto the first number given we must find all the numbers that are multiples of the second numbers/s and return the sum of all those multiples
- If no second number is given use 3 and 5
- If the first number given is 

Algorithm
- define a class names SumOfMultiples
- define a constructor method that iniitalizes instance variables factors to an array containing the given integers
- define a class method and an instance method with the same name - to that takes one or. more arguments
- For the instance method
  - initialize an array multiples []
  - iterate from 0 upto the the argument given - 1
  - for each iteration 
    - iterate over the factors array and for each iteration 
    - check if the argument is a multiple of those values
    - if it is add it to the multiples array
=end

require 'minitest/autorun'
require_relative 'sum_of_multiples'

class SumOfMultiples
  attr_reader :factors
  
  def initialize(*factors)
    factors.empty? ? @factors = [3, 5] : @factors = factors
  end
  
  def to(num)
    multiples = []
    0.upto(num - 1) do |value|
      factors.each { |fac| multiples << value if value % fac == 0 }
    end
    multiples.uniq.sum
  end
  
  def self.to(num)
    SumOfMultiples.new().to(num)
  end
end