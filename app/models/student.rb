class Student < ApplicationRecord
  has_one :journal

  # monkey patch - returns the Journal for this student
  # the patch: auto-creates a Journal if none exists
  # def journal
  #   self.create_journal if journal.nil?
  #   journal
  # end

end
