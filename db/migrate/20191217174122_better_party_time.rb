class BetterPartyTime < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :party_time, :party_started_at
    add_column :users, :party_ended_at, :datetime
  end
end
