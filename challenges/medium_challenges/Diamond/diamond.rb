=begin
- we are given a letter as input 
- we must output a diamond shape with the letters starting from A to the input letter 
- The diamond is a square shape - height is equal to width
- top half is in ascending order 
- bottom half is in descending order

Data Structures
- strings 

Algorithm
- Create a Diamond class with no constructor Method
- define a class method make_diamond that takes one string argument 
- This method should output the Diamond
  - initialize a constant ALPHABETS that has all the characters from a to z upcase
  - iterate from zero upto the input character index times 2 
  - for each iteration 
    - output an empty string the index of the input char times then
    - output the character at the first index 
    - increment 

=end


class Diamond
  ALPHABETS = ('A'..'Z').to_a

  def self.make_diamond(char)
    0.upto(ALPHABETS.index(char) * 2) do |line|
      if line/2 
      puts " " * ALPHABETS.index(char) + ALPHABETS[line] + " " * ALPHABETS.index(char)
    end
  end
end

Diamond.make_diamond('B')

