class School < ApplicationRecord
  has_many :students
  has_many :users
  has_many :checkpoints

  # returns all schools
  def self.all_schools
    School.all
  end

end
