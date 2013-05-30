class CreateDictEntries < ActiveRecord::Migration
  def change
    create_table :dict_entries do |t|
      t.string :phrase
      t.text :translation

      t.timestamps
    end
  end
end
