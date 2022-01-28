class CreateCheckpoints < ActiveRecord::Migration[6.0]
  def change
    create_table :checkpoints do |t|
      t.date :check_at
      t.integer :duration_days, default: 1
      t.string :handle
      t.text :description
      t.references :school, foreign_key: true, optional: true
      t.references :student, foreign_key: true, optional: true

      t.timestamps
    end

    add_reference :goals, :checkpoint, foreign_key: true, optional: true
    add_reference :goal_steps, :checkpoint, foreign_key: true, optional: true

  end
end
