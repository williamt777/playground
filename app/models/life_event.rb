class LifeEvent < ApplicationRecord
  belongs_to :user

  # required relation and attrs
  validates :user_id, presence: true
  validates :description, presence: true
  validates :happened_at, presence: true

end
