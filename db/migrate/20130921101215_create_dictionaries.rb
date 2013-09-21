class CreateDictionaries < ActiveRecord::Migration
  def change
    create_table :dictionaries do |t|
      t.string :language1
      t.string :language2
      t.boolean :is_public, :default => 0

      t.timestamps
    end
  end
end
