=begin
- we are given an octal number and we must convert it to a decimal number
- for invalid inputs we must output 0
- An invalid input can be a word string, a number that has a digit greater than 8

Algorithm
- create a class Octal that take one argument in its constructor
- define the constructor method and initialize an instance variable octal_num to the given value
- define a getter method for it
- define a helper method valid_input? to check if the number given is valid
  - iterate over the input string and for each character
  - check if the character is a number between 0-8
  - return a boolean based on that
- define a method to_decimal
  - check if input is valid by calling the helper method
  - initialize a local variable octal_num to 0
  - if invalid - return 0
  - if valid then iterate through the string flipped and for each character
    - convert it to integer and multiply it by 8 raised to the power of the index
    - increment decimal_num by this number
  - return the value of decimal_num
=end

class Octal
  attr_reader :octal_num

  def initialize(octal_num)
    @octal_num = octal_num
  end

  def to_decimal
    return 0 unless valid_input?

    decimal_num = 0
    octal_num.reverse.chars.each_with_index do |value, idx|
      decimal_num += (value.to_i * (8 ** idx))
    end
    decimal_num
  end

  private

  def valid_input?
    octal_num.chars.each do |num| 
      return false unless num.to_s.match(/[0-7]/)
    end
    true 
  end
end
