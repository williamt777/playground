class CreateLifeEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :life_events do |t|
      t.text :description
      t.datetime :happened_at
      t.text :activity_log
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
