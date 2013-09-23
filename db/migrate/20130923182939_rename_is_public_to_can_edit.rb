class RenameIsPublicToCanEdit < ActiveRecord::Migration
  def up
    rename_column :collaborators, :is_public, :can_edit
  end

  def down
  end
end
