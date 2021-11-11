class CreateJournals < ActiveRecord::Migration[6.0]
  def change
    create_table :journals do |t|
      t.text :comment
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
