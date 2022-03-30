=begin
- generate the 99 bottle song for n amount of time 
- n is inputted during the object instantiation

Algorithm
- create BeerSong class
- define a class method 'verses' that takes one argument(line1) and another optional argument(line2)
  - split the constant by a new line charactes and save into array
  - reverse the array
  - output the string at index n 
  - if a second argument is present output the string at index line2 through line1
- define a class method 'lyrics' that ouputs the whole song
=end

class BeerSong
  def self.verse(line1, line2 = line1)
    verses = lyrics.split(/^\d/).reverse
    line1 == line2 ? verses[line1] : verses[line2 - line1]
  end

  def self.lyrics
    lyrics = []
    99.downto(0) do |line|
      if line > 0
        lyrics << "#{line} bottles of beer on the wall, #{line} bottles of beer.\nTake one down and pass it around, #{line - 1} bottles of beer on the wall."
      elsif line == 0
        
        lyrics << "No more bottles of beer on the wall, no more bottles of beer.
        Go to the store and buy some more, 99 bottles of beer on the wall."
      end
    end
    lyrics.join("\n")
  end
end