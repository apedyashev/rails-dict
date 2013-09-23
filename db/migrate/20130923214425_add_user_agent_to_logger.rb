class AddUserAgentToLogger < ActiveRecord::Migration
  def change
    add_column :activity_logs, :user_agent, :string, :limit => 5000
  end
end
