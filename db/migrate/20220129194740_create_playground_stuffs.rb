class CreatePlaygroundStuffs < ActiveRecord::Migration[6.0]
  def change
    create_table :playground_stuffs do |t|
      t.string :fun_message
      t.references :school, foreign_key: true, optional: true
      t.references :user, foreign_key: true, optional: true
      t.references :student, foreign_key: true, optional: true

      t.timestamps
    end
  end
end
