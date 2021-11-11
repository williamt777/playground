module JournalEntriesHelper

def ux_journal_entry_entered_at_date(the_journal_entry)
  the_journal_entry.entered_at.strftime("%a %b %-d, %Y")
  end

end
