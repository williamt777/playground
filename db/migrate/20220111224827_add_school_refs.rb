class AddSchoolRefs < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :school, foreign_key: true
    add_reference :students, :school, foreign_key: true
  end
end
