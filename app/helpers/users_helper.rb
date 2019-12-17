module UsersHelper

  def ux_textarea_rows(str, min_rows = 2, max_rows = 5)
    x = 0
    x = str.lines.count + 1 if str.present?
    x = min_rows if x < min_rows # at least min rows
    x = max_rows if x > max_rows # no more than max rows
    x
  end

  def ux_party_duration_choices
    ['5 minutes', '15 minutes', '30 minutes', '45 minutes', 
      '1 hour', '2 hours', '4 hours', '6 hours', '8 hours']
  end

  def ux_calc_party_times(date_str, time_str, duration_str)
    # get the start date in the user's time zone
    Time.zone = "Central Time (US & Canada)"
    dt1 = Time.zone.parse(date_str)

    # get the start time, fix the datetime to use it
    time1 = Time.parse(time_str)
    dt_start = dt1.change( hour: time1.hour, min: time1.min)

    # add the duration string to get the end datetime
    dt_end = case duration_str
              when '5 minutes'
                dt_start + 5.minutes
              when '15 minutes'
                dt_start + 5.minutes
              when '30 minutes' 
                dt_start + 5.minutes
              when '45 minutes' 
                dt_start + 5.minutes
              when '1 hour'
                dt_start + 1.hour
              when '2 hours'
                dt_start + 2.hours
              when '4 hours'
                dt_start + 4.hours
              when '6 hours'
                dt_start + 6.hours
              when '8 hours'
                dt_start + 8.hours
              end
    
    # stuff our datetimes into a hash and return
    { start: dt_start, end: dt_end }
    end
end
