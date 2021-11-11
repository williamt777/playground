class User < ApplicationRecord
  has_many :life_events
  has_many :journal_entries

  validates :email, presence: true

  def self.all_users
    User.order( "name ASC")
  end

end
