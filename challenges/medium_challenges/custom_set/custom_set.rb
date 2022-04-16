=begin
Problem
  - create a Set class that behaves similar to the custom set built in type
  - the set must have unique elements 
  - we can manipulate the set using different methods
  - when instantiating a new set object we can either pass arguments or no arguments
Data structures
  - arrays
Algorithm
  - create set Class 
  - define initialize method that takes zero or more arguments
    - initialize an array from all the unique arguments 
    - if no argumnet given initialize to an empty array 
  - define the following methods 
    - empty? - no arg
      - returns true if the set is empty
    - contains? - one arg
      - iterates through the set and returns true if the given arguments is equal to any of the elements 
    - subset? - one arg 
      - returns true if the given arguments is a subset of the calling object 
      - an empty object can be a subset if any other set objects 
      - But no objects are a subset of an empty Object
      - two empty objects can be subsets of eachother
      - all the elements of the calling objects must be found in the objects passed in as anargument 
    - disjoint? - one arg
      - two empty objects are disjoint
      - two set objects are disjoint if they don't have any elements in common
    - eql? - one arg
      - returns true if the size of the set object and the ordered elements are equal 
    - == - one arg
      - checks if the two objects are equal (equal size and elements when ordered)
    - add - one arg 
      - addes the given argument to the array object 
    - intersection - one arg
      - returns a new set object that has all the common elements of the two objects 
      - if there is no common elements, it returns an empty set object
    - difference - one arg 
      - returns a new set object that has all the elements found in the calling object but not in the passed argument 
      - returns an empty set object if all elements are in both
    - union - one arg 
      - returns a new object that has all the elements in both objects combined
=end

require 'minitest/autorun'
# require_relative 'custom_set'

class CustomSet
  attr_accessor :elements

  def initialize(elements = [])
    @elements = elements.uniq.sort
  end

  def empty?
    elements.empty?
  end

  def contains?(arg)
    elements.include?(arg)
  end

  def subset?(other_set)
    return true if self.empty?
    return false if other_set.empty?

    elements.all? { |ele| other_set.contains?(ele) }
  end

  def disjoint?(other_set)
    return true if self.empty? || other_set.empty?

    elements.none? { |ele| other_set.contains?(ele) }
  end

  def eql?(other_set)
    elements == other_set.elements
  end

  def add(new_element)
    elements << new_element unless self.contains?(new_element)
    CustomSet.new(elements)
  end

  def ==(other_set)
    elements == other_set.elements
  end

  def intersection(other_set)
    intersection = elements.select { |ele| other_set.contains?(ele) }
    CustomSet.new(intersection)
  end

  def difference(other_set)
    difference = []
    elements.each { |ele| difference << ele unless other_set.contains?(ele) } unless self.empty?
    CustomSet.new(difference)
  end

  def union(other_set)
    union = elements + other_set.elements
    CustomSet.new(union)
  end
end