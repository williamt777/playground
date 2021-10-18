
# This module contains ONLY the most basic util methods
# for strings and numbers.
module Util

  extend self

  # Returns true if the string is a valid integer
  def is_integer(str)
    Integer(str) != nil rescue false
  end

  # Returns true if the string is numberic (a valid float)
  def is_numeric(str)
    Float(str) != nil rescue false
  end

  # Returns the name of the month for the given date
  def month_name(the_date)
    Date::MONTHNAMES[the_date.month]
  end

end
