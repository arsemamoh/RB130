=begin
Problem
  - we must construct objects that represent a meetup date
  - the meetup takes a year and month when created
  - we determine what exact date the meetup will be
  - to determine that we aregiven the name of the day(monday, tuesday,...) and the descriptors (first, second,...)
  - different months have different number of days
    - january, march, may, july, august, october and dec has 31 days
    - february has 28 days
  - the first XDOWM occurs between 1st to 7th
  - second XDOWM occurs between 8th to 14th
  - third XDOWM occures between 15th to 21th
  - fourth XDOWM occurs between 22nd to 28th
  - fifth XDOWM occurs between 29th to 30/31 
Example
  - 
Data structures
  - integer and string as inputs
  - string - output
Algorithm
  - create Meetup class
  - create constant DOWM with the weekday and the corresponding dates for it
  - initialize constant WEEKDAYS 
  - constructor takes 2 parameters - year, month
  - define instance method day(weekday, schedule)
    - should return a Date object 
    - find the range of possible dates for the schedule day in question
    - initialize local variable schedule_date
    - iterate over the range of dates
    - for each iteration 
      - check if each date instance created by that date is valid and 
      - if the weekday of that created date is the same as the given weekday 
      - if both are true reassign schedule_date to that value
        - return a date object with that month year and date
      - if either one is false
        - return nil
=end

require 'minitest/autorun'
require 'date'
# require_relative 'meetup'

class Meetup
  attr_accessor :year, :month

  WEEKDAYS = ['sunday', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday']
  DOWM = {
    'first' => (1..7).to_a,
    'second' => (8..14).to_a,
    'third' => (15..21).to_a,
    'fourth' => (22..28).to_a,
    'fifth' => (29..31).to_a,
    'teenth' => (13..19).to_a,
    'last' => (22..31).to_a
}
  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, schedule)
    date_range = DOWM[schedule.downcase] # an array of integers
    schedule_date = 0
    date_range.each do |date|
      return nil unless Date.valid_date?(year, month, date)
      schedule_date = date if Date.valid_date?(year, month, date) && Date.civil(year, month, date).wday == WEEKDAYS.index(weekday.downcase)
    end
    return nil if schedule_date == 0

    Date.civil(year, month, schedule_date)
  end
end