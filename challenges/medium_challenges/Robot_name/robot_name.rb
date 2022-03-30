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

class Robot
  @@used_names = []

  def name
    if @@used_names.include?(@name)
      @name
    else 
      @name = generate_name
      @@used_names << name
    end
  end

  def generate_name
    name = []
    name << ('A'..'Z').to_a.sample(2)
    name << rand(10**3).to_s
    name.join
  end

  def self.names
    @@used_names
  end
end

p Robot.new.name
p Robot.names