class StaticPagesController < ApplicationController

  def home
    @playground_stuff = PlaygroundStuff.the_singleton
  end

  def hook; end

  def run_hook
    hook_msg = hook2
    redirect_to hook_path, notice: hook_msg
  end

  private

  # returns students and users that don't have a school (and therefore
  # break The Playground)
  def hook2
    sch1 = School.first

    arr1 = []
    Student.all.each do |each_student|
      if each_student.school.blank?
        arr1.push each_student.name
        each_student.school = sch1
        each_student.save
      end
    end
    str1 = "Missing a school - Fixed these STUDENTS: "
    str1 += arr1.to_s

    arr2 = []
    User.all.each do |each_user|
      if each_user.school.blank?
        arr2.each_user.name
        each_user.school = sch1
        each_user.save
      end
    end
    str1 += "; Fixed these USERS too: "
    str1 += arr2.to_s
    str1
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
    msg
  end

end
