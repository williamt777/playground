module LifeEventsHelper

  def ux_happened_at_date(the_life_event)
    the_life_event.happened_at.strftime("%a %b %-d, %Y")
  end

end
