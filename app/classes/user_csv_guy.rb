require "csv"

class UserCsvGuy
  include Util

  attr_reader :import_str
  attr_reader :array_of_rows

  def initialize(import_str)
    @import_str = import_str
    @array_of_rows = init_rows(@import_str)
  end

  # Returns the number of rows that have acceptable data
  # It's all rows with check_code OK or Warning, and not Error
  def num_acceptable_rows
    ok_count = 0
    @array_of_rows.each do |each_hash|
      ok_count += 1 if each_hash[:check_code] != "Error"
    end
    ok_count
  end

  def row_str(the_row)
    the_row[:csv_row].to_s
  end

  def row_full_comment(the_row)
    str = ""
    if the_row[:check_code] != "Ok"
      str << " # "
      str << the_row[:check_code]
      str << ": "
      str << the_row[:check_comment]
    end
    str
  end

  def row_bootstrap_css(the_row)
    css_class =
      case the_row[:check_code]
      when "Ok"
        "text-success"
      when "Warning"
        "text-warning"
      when "Error"
        "text-danger"
      else
        ""
      end
  end

  def accept_rows
    @array_of_rows.each do |each_hash|
      if each_hash[:check_code] != "Error"
        row = each_hash[:csv_row]

        user = User.where( email: row["Email"])
        if user.present?
          num_stars = row["Stars"].to_i
          user.update(:stars => num_stars)
        end
      end
    end
  end

  private

  # Returns an array of row hashes; this initializes rows in the Guy.
  # For each CSV row: check it, create a hash, add it to the array.
  def init_rows(csv_str)
    array = []
    CSV.parse(csv_str, headers: true) do |row|
      row_hash = check_row(row)
      array << row_hash
    end

    return array
  end

  def check_row(row)
    # default values are success
    check_hash = {csv_row: row, check_code: "Ok", check_comment: ""}

    # Do our checking: 1) user, 2) party time, and 3) stars
    check_user(row["Email"], check_hash)

    check_party_time(row["Party time"], check_hash)

    check_stars(row["Stars"], check_hash)

    check_hash
  end

  def check_user(email_str, check_hash)
    # guard: one error at a time
    return if check_hash[:check_code] != "Ok"

    user = User.where( email: email_str)
    if user.blank?
      check_hash[:check_code] = "Error"
      check_hash[:check_comment] = "no user with that email"
    end
  end

  def check_party_time(party_str, check_hash)
    # guard: one error at a time
    return if check_hash[:check_code] != "Ok"

    str2 = party_str.strip if party_str.present?
    if str2.blank?
      check_hash[:check_code] = "Error"
      check_hash[:check_comment] = "no party time specified"
    else
      t = Time.zone.parse(party_str)
      if t.nil?
        check_hash[:check_code] = "Error"
        check_hash[:check_comment] = "party time is incorrect"
      end
    end
  end

  def check_stars(stars_str, check_hash)
    # guard: one error at a time
    return if check_hash[:check_code] != "Ok"

    if stars_str.blank?
      # blank or missing string defaults to 0
      check_hash[:check_code] = "Warning"
      check_hash[:check_comment] = "no stars specified; using default=0"
    else
      str2 = stars_str.strip
      if ! is_integer(str2)
        check_hash[:check_code] = "Error"
        check_hash[:check_comment] = "not an integer"
      else
        stars_value = str2.to_i
        if stars_value < 0
          check_hash[:check_code] = "Error"
          check_hash[:check_comment] = "stars number cannot be negative"
        end
      end
    end
  end

end
