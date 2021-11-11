module ApplicationHelper

  # Returns the correct "is" or "are" given a count.
  # A count of one is the special case: The is 1 widget. There are 7 widgets.
  def pluralize_is_are(count)
    count == 1 ? "is" : "are"
  end
end
