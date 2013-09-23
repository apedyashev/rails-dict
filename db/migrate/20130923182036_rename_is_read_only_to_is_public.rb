class RenameIsReadOnlyToIsPublic < ActiveRecord::Migration
  def up
    rename_column :collaborators, :is_read_only, :is_public
    change_column :collaborators, :is_public, :boolean, :default => 0
  end

  def down
  end
end
