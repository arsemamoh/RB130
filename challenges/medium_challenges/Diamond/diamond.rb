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
- Initialize a constant LETTERS to array of the letter from 'A' to 'Z'
- define a class method make_diamond that takes one argument
  - iterate from 0 upto the index of the arg in LETTERS

=end

class Diamond
  LETTERS = ('A'..'Z').to_a
  DISTANCE = (1..28).to_a.select(&:odd?)

  def self.make_diamond(char)
    diamond = ""
    char_index = LETTERS.index(char)
    diamond = make_top_rows(char_index) + make_bottom_rows(char_index)
    diamond
  end

  def self.make_top_rows(index)
    0.upto(index) do |line| # index = 4
      if line == 0
        puts " " * index + LETTERS[line] + " " * index
      else
        puts " " * (index - line) + LETTERS[line] + " " * (DISTANCE[line - 1]) + LETTERS[line]
      end
    end
  end

  def self.make_bottom_rows(index)
    (index - 1).downto(0) do |line|
      if line == 0
        puts " " * index + LETTERS[line] + " " * index
      else
        puts " " * (index - line) + LETTERS[line] + " " * (DISTANCE[line - 1]) + LETTERS[line] + " " * (index - line)
      end
    end
  end
end