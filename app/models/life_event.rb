class LifeEvent < ApplicationRecord
  belongs_to :user

  # required relation and attrs
  validates :user_id, presence: true
  validates :description, presence: true
  validates :happened_at, presence: true

  def self.all_for_user(the_user, sorted: true)
    LifeEvent.all.where(user: the_user).order( "happened_at ASC")
  end

end
