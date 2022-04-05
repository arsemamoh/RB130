=begin
- we are given a ternary number which is a number comprised of 0,1 and 2
- we must convert the number to a decimal number 
Data structure 
- string - Input
- integer - output
- Array
Algorithm
- create Terinary class 
- constructor has one Argument
  - if the input argument is a valid_input? initialize instance variable terinary to the value of the input turned to an array reversed
- define method called to_decimal 
  - initialize a local variable decimal = 0
  - iterate through terinary array 
  - for each iteration 
  - multiply the value with 3 raised to the power of the index 
  - increment decimal by that value 
- define method called valid_input
  - iterate through the input characters and check any of the characters are different from 0,1 or 2
=end

require 'minitest/autorun'
# require_relative 'trinary'

class Trinary 
  attr_reader :trinary

  def initialize(trinary)
    valid_input?(trinary) ? @trinary = trinary.chars.reverse : @trinary = [0]
  end

  def to_decimal
    decimal = 0

    trinary.each_with_index do |val, idx|
      decimal += val.to_i * (3 ** idx)
    end

    decimal
  end

  private 

  def valid_input?(input)
    input.chars.all? { |char| char.match(/[0-2]/) }
  end
end

class TrinaryTest < Minitest::Test
  def test_trinary_1_is_decimal_1
    assert_equal 1, Trinary.new('1').to_decimal
  end

  def test_trinary_2_is_decimal_2
    # skip
    assert_equal 2, Trinary.new('2').to_decimal
  end

  def test_trinary_10_is_decimal_3
    # skip
    assert_equal 3, Trinary.new('10').to_decimal
  end

  def test_trinary_11_is_decimal_4
    # skip
    assert_equal 4, Trinary.new('11').to_decimal
  end

  def test_trinary_100_is_decimal_9
    # skip
    assert_equal 9, Trinary.new('100').to_decimal
  end

  def test_trinary_112_is_decimal_14
    # skip
    assert_equal 14, Trinary.new('112').to_decimal
  end

  def test_trinary_222_is_26
    # skip
    assert_equal 26, Trinary.new('222').to_decimal
  end

  def test_trinary_1122000120_is_32091
    # skip
    assert_equal 32_091, Trinary.new('1122000120').to_decimal
  end

  def test_invalid_trinary_is_decimal_0
    # skip
    assert_equal 0, Trinary.new('carrot').to_decimal
  end

  def test_invalid_trinary_with_digits_is_decimal_0
    # skip
    assert_equal 0, Trinary.new('0a1b2c').to_decimal
  end
end