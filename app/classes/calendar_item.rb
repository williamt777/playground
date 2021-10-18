#
# Represents an item (or event) in a SimpleCalendar
#
class CalendarItem
  attr_reader :start_time
  attr_reader :note

  def initialize(start_time, note)
    @start_time = start_time
    @note = note
  end

end
