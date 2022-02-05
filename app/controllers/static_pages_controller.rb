class StaticPagesController < ApplicationController

  def home
    @playground_stuff = PlaygroundStuff.the_singleton
  end

  def hook; end

  def run_hook
    hook_msg = hook1
    redirect_to hook_path, notice: hook_msg
  end

  # make sure each student and user has a non-nil school
  def hook1
    school1 = School.first

    # for all students, set school_id to 1 if nil
    num_students = 0
    Student.all.each do |each_student|
      if each_student.school.blank?
        each_student.school = school1
        each_student.save
        num_students += 1
      end
    end

    # for all students, set school_id to 1 if nil
    num_users = 0
    User.all.each do |each_user|
      if each_user.school.blank?
        each_user.school = school1
        each_user.save
        num_users += 1
      end
    end

    # construct and return helpful hook message
    msg = "hook1: updated school for " + helpers.pluralize(num_students, "student") +
          ", " + helpers.pluralize(num_users, "user")
    return msg
  end

end
