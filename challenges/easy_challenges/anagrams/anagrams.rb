=begin
- we are given a string and an array of several strings
- we must find the elements in the array that have the same letters as the given string
- if all of the elements don't have the same letters return an empty array
- the return value should be an array collection
- the method should be case insensitive
- the return array should not include the same word

Algorithm
- create Anagram class that takes one argument in its constructor
- create a getter method for the value referenced by the argument
- create a method match 
  - initialize an empty array anagram = []
  - iterate through the given array
    - for each element
      - check if the element downcased is equal to the given string downcased
      - if so move to the next element
      - if it is not
      - check if the given word letters sorted are equal to the elements letters sorted
      - if they are the same add the element to the anagram array
  - return the anagram array 

=end

class Anagram
  attr_reader :string

  def initialize(string)
    @string = string.downcase
  end

  def match(list)
    anagrams = []
    list.each do |word|
      next if word.downcase == string
      anagrams << word if word.downcase.chars.sort == string.chars.sort
    end
    anagrams
  end
end