module UsersHelper

  # def ux_textarea_rows(str, min_rows=2, max_rows=5)
  #   x = min_rows
  #   x = [str.lines.count + 1, max_rows].min if str.present?
  #   x
  # end

  def ux_textarea_rows(str, min_rows = 2, max_rows = 5)
    x = 0
    x = str.lines.count + 1 if str.present?
    x = min_rows if x < min_rows # at least min rows
    x = max_rows if x > max_rows # no more than max rows
    x
  end
end
