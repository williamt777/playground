class Checkpoint < ApplicationRecord
  belongs_to :school, optional: true
  belongs_to :student, optional: true

  validates :check_at, presence: true
  validates :handle, presence: true, length: {maximum: 16}
  validates :description, presence: true
end
