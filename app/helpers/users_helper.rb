module UsersHelper

  def ux_textarea_rows(str, min_rows=2, max_rows=5)
    x = min_rows
    x = [str.lines.count + 1, max_rows].min if str.present?
    x
  end
end
