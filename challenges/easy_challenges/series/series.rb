=begin
- we are given a string of integers
- we must return an array with elements of the consecutive
number series of the given length
- if we are given the number 45348 and a the integer 3
  - we must return - [[4,5,3], [5,3,4], [3,4,8]]

Algorithm
- create a class series that takes one argument - a string of integers
- define a constructor method that initializes an instance varaible 
@number to the given string turned to an array of characters
- define an instance method slices that take one argument - length
  - raise an error if length is greater than the length of the string given
  - initialize an empty array series =[]
  - iterate over the array number
  - for each iteration
    - slice the array starting from the value upto the length given
    - push that value to the series array
    - break iteration if the return value of the sliced array length 
    is greater than the given length
    - return the array with the elements elements turned to an integer
=end

class Series
  attr_reader :number

  def initialize(number)
    @number = number.chars
  end

  def slices(length)
    raise ArgumentError.new if length > number.length
    series = []
    0.upto(number.size - 1) do |idx|
      series << number[idx, length] if number[idx, length].length == length
    end

    series.map {|ele| ele.map(&:to_i)}
  end
end