class CreateUserConnections < ActiveRecord::Migration
  def change
    create_table :user_connections do |t|
      t.integer :user_id
      t.integer :connected_user_id
      t.boolean :is_connection_accepted

      t.timestamps
    end
  end
end
