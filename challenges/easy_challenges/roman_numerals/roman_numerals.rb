=begin
problem
- create a class RomanNumeral with a constructor that takes one argument
- has a method to_roman that converts the given argument integer to a roman numeral

Algorithm
- create an array called roman_num = []
- create a loop and for each iteration
- initialize a remainder local var to the given integer
- if the number is greater than 999
  - divide the integer by 1000
    - for the quotient, push M to the roman_num array that many times
    - reassign the remainder local var
- if the number is greater than 
=end

class RomanNumeral
  CONVERSION = {:I => 1, :V => 5, :X => 10, :L => 50, :C => 100, :D => 500, :M => 1000}
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def to_roman
    digits = number.digits
    roman_num = []
    digits.each do |digit|
      position = digits.index(digit) 
      case position
      when -4
        digit.times{|n| roman_num << M}
      when -3
        digit.times{|n| roman_num << D}
      when -2
        digit
  end
end