class IncreaseSizeOfDataFieldInLogger < ActiveRecord::Migration
  def up
    change_column :activity_logs, :data, :string, :limit => 5000
  end

  def down
    change_column :activity_logs, :data, :string
  end
end
