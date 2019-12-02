class AddPartyTimeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :party_time, :datetime
  end
end
