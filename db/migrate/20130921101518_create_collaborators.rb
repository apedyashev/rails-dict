class CreateCollaborators < ActiveRecord::Migration
  def change
    create_table :collaborators do |t|
      t.integer :dictionary_id
      t.integer :user_id
      t.boolean :is_read_only, :default => 1

      t.timestamps
    end
  end
end
