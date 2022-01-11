class Student < ApplicationRecord
  belongs_to :school
  has_one :journal

  validates :school_id, presence: true

  # monkey patch - returns the Journal for this student
  # the patch: auto-creates a Journal if none exists
  # def journal
  #   self.create_journal if journal.nil?
  #   journal
  # end

end
