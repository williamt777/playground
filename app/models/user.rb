class User < ApplicationRecord

  validates :email, presence: true

  def self.all_users
    User.order( "name ASC")
  end

end
