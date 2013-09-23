class AddDictionaryIdToDictEntries < ActiveRecord::Migration
  def change
    add_column :dict_entries, :dictionary_id, :integer
  end
end
