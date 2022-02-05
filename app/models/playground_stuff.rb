class PlaygroundStuff < ApplicationRecord
  belongs_to :school, optional: true
  belongs_to :student, optional: true
  belongs_to :user, optional: true

  def self.the_singleton
    s1 = PlaygroundStuff.first
    return s1 if s1.present?

    # singleton is only created once!
    u1 = User.first
    if u1.school.blank?
      sch1 = School.create(name: "Tmp school", handle: "tmp", color: "black")
      u1.school = sch1
      u1.save
    end
    stu1 = u1.school.students.first
    s1 = PlaygroundStuff.create( fun_message: "Create singleton",
                                 user: u1, student: stu1)
    s1
  end

  # returns current user
  def cur_user
    user
  end

  # returns current school, which is always the user's school
  def cur_school
    user.school
  end

  # returns the current student
  def cur_student
    student
  end

  # check/correct the Playground Stuff after an update
  # make sure the student comes from the user's school!
  def check_after_update
    if student.blank? || student.school != user.school
      update( student: Student.first_student(user.school))
    end
  end

end
