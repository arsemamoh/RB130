=begin
we are given a number and we must find out whether the number is 
  - perfect
  - deficient or 
  - abundant
We determine that by calculating the aliquot sum of the number
Aliquot sum is the sum of all the divisors of the number other than itself

Algorithm
- create a PerfectNumber class
- define a class method classify
  - take one integer argument
  - the argument cannot be a negative number or zero
  - initialize an empty array called aliquot_sum
  - starting from 1 to the given integer - 1 iterate
  - for each iteration
    - check if dividing the given number by the value has no remainder
    - if it has no remainder, add the value to the aliquot_sum array
    - if it does go to the next value
  - add the values of the aliquot_sum array 
  - compare the sum to the given integer
  - if it is greater - return 'abundant'
  - if it is less than - return 'deficient'
  - if it is equal - return 'perfect'
=end

class PerfectNumber
  def self.classify(int)
    raise StandardError.new if int <= 0
    divisors= []

    1.upto(int - 1) do |val|
      divisors << val if int % val == 0
    end

    aliquot_sum = divisors.sum

    if aliquot_sum < int
      'deficient'
    elsif aliquot_sum > int
      'abundant'
    elsif aliquot_sum == int
      'perfect'
    end
  end
end