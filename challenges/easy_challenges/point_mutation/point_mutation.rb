=begin
- Given two strands of DNA
- Count the differences between them
- If one is shorter than the other, check the difference
  for the length of the shorter strand
Algorithm
  - initialize a local variable counter to 0
  - check if the two given strands are the same 
    - if they are return counter thats 0
  - if they are the same length but different
    - iterate from 0 to the length of the strand -1 
    - for each iteration check if the element at that index for each strand is the same
    - if it is the same increment counter by 0
    - if not go to the next element
  - if they are different length
    - slice the longer strand to the length of the shorter strand 
    - repeat the above steps 
  - return counter at the end of the method
=end

class DNA
  attr_reader :strand, :strand_size

  def initialize(strand)
    @strand = strand
    @strand_size = strand.length
  end

  def check_difference(strand1, strand2)
    counter = 0
    0.upto(strand1.size) do |idx|
      counter += 1 unless strand1[idx] == strand2[idx]
    end
    counter
  end

  def hamming_distance(other_strand)
    if strand.length == other_strand.length
      check_difference(strand, other_strand)
    elsif strand.length > other_strand.length
      check_difference(strand[0..other_strand.length - 1], other_strand)
    elsif strand.length < other_strand.length
      check_difference(strand, other_strand[0..strand.length - 1])
    end
  end
end
