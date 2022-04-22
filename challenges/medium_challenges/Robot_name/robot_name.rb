=begin
- In a robot factory when we boot a robot it generates a random name for the robot 
- When we reset that robot, the name gets wiped and jnext time it gets booted, it'll have brand new random name 
- all the generated names should not collide
  - two robots should not have the same name 
- the name of the robot should be to capital letters followed by three digits 

Data structures
- strings

Algorithm
- create a Robot class with no argument for the constructor Method
- define a class variable - generated_names to an empty array 
- create a getter method name 
- the constructor method should generate the name
  - call the generate_name method 
  - check if the name already name_exists
  - if it does generate a new name
  - else 
  - return the joined string as the value of the instance variable name and add the name to the generated_name array
- create a helper method - generate_name
  - initialize an empty array name = []
  - sample from a to z and push to the name array twice 
  - add a random three digit number to name after turning it to a string 
- create a helper method - name_exists? with one argument
  - check if the given argument exists in the generated_name Array
  - if it does return true else return false 
=end
require 'minitest/autorun'

class Robot
  attr_writer :name

  @@used_names = []

  def name
    @name.nil? ? @name = generate_name : @name
  end

  def reset
    self.name = nil
  end 

  def generate_name
    name = name_prefix + name_digit
    if @@used_names.include?(name)
      generate_name
    else
      @@used_names << name
      return name
    end
  end

  private

  def name_prefix
    ('AA'..'ZZ').to_a.sample
  end

  def name_digit
    ('000'..'999').to_a.sample
  end
end