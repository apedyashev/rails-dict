class AddUserIdAndDataToActivityLog < ActiveRecord::Migration
  def change
    add_column :activity_logs, :user_id, :integer
    add_column :activity_logs, :data, :string
  end
end
