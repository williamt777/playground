class Checkpoint < ApplicationRecord
  belongs_to :school, optional: true
  belongs_to :student, optional: true

  validates :check_at, presence: true
  validates :handle, presence: true, length: {maximum: 16}
  validates :description, presence: true

  scope :from_past, -> { where("check_at < ?", Date.today) }
  scope :in_future, -> { where("check_at >= ?", Date.today) }

  def self.all_past_checkpoints
    Checkpoint.all.from_past.order("check_at ASC")
    # Student.active.order("handle ASC")
  end

  def self.all_future_checkpoints
    Checkpoint.all.in_future.order("check_at ASC")
  end

end
