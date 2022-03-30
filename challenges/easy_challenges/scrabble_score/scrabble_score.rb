=begin
- we are given a string of word characters
- we must calculate the score based on the tile scores
- for each character we must add up the score and return that value
- the method should be case insesitive

Algorithm
- create a Scrabble class with one argument in its constructor
- define a getter method to access the given argument
- create a hash object that has the array of the group of letters as keys and
  their value as a value - tile_score
- define a method score
  - initialize a score local variable  to 0
  - iterate through each character of the given string downcased
    - iterate through the keys of tile_score
      - for each iteration check of the character is found in the keys of tile_score
      - if it is, increment score by that value
      - if it is not move to the next character
  - return score
=end

class Scrabble
  attr_reader :word
  TILE_SCORE = {['a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't'] => 1, ['d', 'g'] => 2,
                ['b', 'c', 'm', 'p'] => 3, ['f', 'h', 'v', 'w', 'y'] => 4,
                ['k'] => 5, ['j', 'x'] => 8, ['q', 'z'] => 10 }
  def initialize(word)
    @word = word
  end

  def score
    score = 0
    return score if word == nil || word.match(/\s/)
    word.downcase.chars.each do |char|
      score_keys = TILE_SCORE.keys
      score_keys.each do |group|
        score += TILE_SCORE[group] if group.include?(char)
      end
    end
    score
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end