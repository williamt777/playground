class User < ApplicationRecord
  has_many :life_events

  validates :email, presence: true

  def self.all_users
    User.order( "name ASC")
  end

end
