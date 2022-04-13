=begin
Problem
  - create a clock that is independent of date
  - we can add or subtract minutes from the time set on the Clock
  - if two clocks represent the same time then they should be equal 
  - can't use built in methods
  - theinput to the instance method at will be integers  
    - the first representing the hour on the clock 
    - the second is the minute on the clock 
    - the output should give two digit number for both the minute and hour separated by a colon
  - when adding or subtracting - we are chanining minutes
  - midnight is '00:00'
  - if adding or subtracting more than a day, still output in terms of hour and minutes
Example
  - 8 -> '08:00'
  - 11, 9 -> '11:09'
  - 0 - 50 -> '23:10'
  - 23, 30 + 60 -> '00:30'
  - 10 + 3061 -> '06:59'
  - 15, 37 and 15, 37 are equal 
  - 0, 30 - 60 and 23, 30 are equal 
Data structures
  - inputs are integers for all instance methods
  - output should be a string with two two digit numbers separated by a colon
Algorithm
  - create Clock Class
  - define constructor with two parameters(hour, minute)
    - @hour = hour 
    - @minutes = minute
  - define class method at with two parameters
    - @@hour = first par
    - @@minute = second par
    - instantiate a new clock object with @@hour and @@minute as arguments
  - define to_s Method
    - format output to be two digit hour and two digit minute seprated by a colon
  - define + method with one parameter(added_minutes)
    - minutes from midnight = 1440 - total_minutes
    - if minutes from midnight is less than added_minutes
      - subtract added_minutes from minutes from midnight 
      - return that value as a clock Object
    - if minutes from might is greater than added_minutes
      - if added_minutes is greater than 1439 
        - then divmod to 1439 and take the second return value
        - increment minutes by the second and hour by the first value of value.divmod(60)
      - if added_minutes is less than 1440
        - increment minutes by the second and hour by the first value of value.divmod(60)
  - define total_minutes Method
    - calculate the total minutes on the clock
  - define == instance Method
    - check if the value of hour and minute is equal for both objects

=end

class Clock
  attr_accessor :hour, :minute

  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end

  def self.at(hour, minute = 0)
    @@hour = hour
    @@minute = minute
    Clock.new(@@hour, @@minute)
  end

  def to_s
    "#{format('%02d', hour)}:#{format('%02d', minute)}"
  end

  def +(added_minutes)
    total_time = total_minutes(hour, minute) + added_minutes
    if (1..1439).include?(total_time)
      self.hour, self.minute = total_time.divmod(60)
      Clock.new(hour, minute)
    else
      added_day, added_minutes = total_time.divmod(1440)
      self.hour, self.minute = added_minutes.divmod(60)
      Clock.new(hour, minute)
    end
  end

  def total_minutes(hour, minute)
    hour == 0 && minute == 0 ? 1440 : (hour * 60) + minute
  end

  def -(removed_minutes)
    total_time = total_minutes(hour, minute) - removed_minutes
    if (-1..-1439).include?(total_time)
      self.hour, self.minute = (total_time * -1).divmod(60)
      Clock.new(hour, minute)
    else
      removed_day, removed_minutes = (total_time * -1).divmod(1440)
      subtracted_minutes = 1440 - removed_minutes
      self.hour, self.minute = subtracted_minutes.divmod(60)
      Clock.new(hour, minute)
    end
  end

  def ==(other_clock)
    hour == other_clock.hour && minute == other_clock.minute
  end
end