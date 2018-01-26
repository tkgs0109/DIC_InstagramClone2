class DropTables < ActiveRecord::Migration[5.1]
  def change
    drop_table :contacts
    drop_table :feeds
  end
end
