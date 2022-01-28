class School < ApplicationRecord
  has_many :students
  has_many :users
  has_many :checkpoints
end
