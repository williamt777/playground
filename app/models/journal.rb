class Journal < ApplicationRecord
  belongs_to :student
  has_many :journal_entries
end
