class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :handle
      t.string :color

      t.timestamps
    end
  end
end
