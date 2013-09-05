class CreateActivityLogs < ActiveRecord::Migration
  def change
    create_table :activity_logs do |t|
      t.string :action, :limit => 15
      t.string :ip_addr, :limit => 20
      t.string :x_ip_addr, :limit => 20
      t.string :url

      t.timestamps
    end
  end
end
