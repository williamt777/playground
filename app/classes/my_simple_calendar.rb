#
# MySimpleCalendar (msc) is a simple, interactive monthly calendar.
#
# Lots of code from SimpleCalendar gem GoRails Chris.
# www.rubygems.org/gems/simple_calendar
#
class MySimpleCalendar

  attr_reader :start_date
  attr_reader :selected_date

  # Creates the calendar, nil params gives you today as the start date
  def initialize(params = nil)
    params = {} if params.nil? # guard

    # get start date from params, nil means today is the start date
    d1 = Date.parse(params["start_date"]) rescue nil
    move_start_date(d1)

    # handle params that move to prev/next month in the calendar
    if params["msc_prev"]
      move_prev
    elsif params["msc_next"]
      move_next
    end

    # get selected date from params, check for new selected date as well
    @selected_date = Date.parse(params["selected_date"]) rescue nil
    d2 = Date.parse(params["new_selected_date"]) rescue nil
    change_selected_date(d2) if d2

    # date list of items is empty for now
    @date_list = []
  end

  # returns an array of dates for the calendar, using the start date
  def date_range
    (@start_date.beginning_of_month.beginning_of_week..@start_date.end_of_month.end_of_week).to_a
  end

  # move calendar to the state date, if nil, then today is the default
  def move_start_date(the_date = nil)
    @start_date = the_date
    @start_date ||= Date.current # default to today
  end

  # move calendar to the previous month
  def move_prev
    @start_date = @start_date.beginning_of_month - 1.month
  end

  # move calendar to the next month
  def move_next
    @start_date = @start_date.beginning_of_month + 1.month
  end

  # sets the "selected date" in the calendar, nil is ok and means no selection
  def change_selected_date(the_date)
    if the_date == @selected_date
      @selected_date = nil
    else
      @selected_date = the_date
    end
  end

  # Add dates for items to be noted in the calendar (usually with underline)
  def add_item_dates(the_date_list)
    the_date_list.each { |each_date| @date_list << each_date }
  end

  # returns the names of days in the week: Sunday thru Monday
  def day_names(format: :one_letter)
    case format
    when :abbr
      Date::ABBR_DAYNAMES
    when :full
      Date::DAYNAMES
    else
      Date::DAYNAMES.map { |day| day.first } # default is one char day names
    end
  end

  # returns the calendar name of the month
  def month_name(format: :full)
    case format
    when :abbr
      Date::ABBR_MONTHNAMES[@start_date.month]
    else
      Date::MONTHNAMES[@start_date.month]
    end
  end

  # returns the calendar year
  def year
    @start_date.year
  end

  # returns a handy calendar title: October 2021
  def title(format: :full)
    month_name(format: format) + " " + year.to_s
  end

  # returns a string of CSS classes assigned for the day
  def css_classes(the_day)
    today = Date.current

    css1 = ["day"]
    css1 << "day#{the_day.wday}"

    css1 << "today" if the_day == today
    css1 << "past" if the_day < today
    css1 << "future" if the_day > today

    css1 << "cur-month" if @start_date.month == the_day.month && @start_date.year == the_day.year
    css1 << "prev-month" if @start_date.month != the_day.month && the_day < @start_date
    css1 << "next-month" if @start_date.month != the_day.month && the_day > @start_date

    css1 << "selected-date" if the_day == @selected_date
    css1 << "has-items" if @date_list.include?the_day

    css1.join(" ")
  end

  # returns true if the day is in the calendar month
  def is_cur_month(the_day)
    (the_day.year == @start_date.year && the_day.month == @start_date.month)
  end

  # returns true if the day is during the week (not on the weekend)
  def is_weekday(the_day)
    ! is_weekend(the_day)
  end

  # returns true if the day is on the weekend (Sat, Sun)
  def is_weekend(the_day)
    (the_day.saturday? || the_day.sunday?)
  end

  # returns the number of rows/weeks in the calendar this month
  def num_weeks
    date_range.count / 7
  end

  # returns a hash of params for "prev" link in a view
  def params_for_prev
    {start_date: @start_date, selected_date: @selected_date, msc_prev: true}
  end

  # returns a hash of params for "next" link in a view
  def params_for_next
    {start_date: @start_date, selected_date: @selected_date, msc_next: true}
  end

  # returns params hash to jump calendar to the given date
  def params_for_jump(the_date)
    {start_date: the_date, selected_date: @selected_date}
  end

  # returns a params hash for the link to select a date
  def params_for_selected_date(the_date)
    {start_date: @start_date, selected_date: @selected_date,
     new_selected_date: the_date}
  end

  # returns a params hash to clear the selected date
  def params_for_clear_selected_date
    {start_date: @start_date, selected_date: @selected_date,
     new_selected_date: @selected_date}
  end

end
