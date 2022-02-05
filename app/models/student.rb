class Student < ApplicationRecord
  belongs_to :school
  has_one :journal
  has_many :checkpoints

  validates :school_id, presence: true

  scope :all_at_school, ->(school) { where(school_id: school.id) }

  # returns all students at the school
  def self.all_students(the_school)
    Student.all_at_school(the_school)
  end

  # returns the first student at a school
  def self.first_student(the_school)
    Student.all_at_school(the_school).first
  end

  # monkey patch - returns the Journal for this student
  # the patch: auto-creates a Journal if none exists
  # def journal
  #   self.create_journal if journal.nil?
  #   journal
  # end

end
