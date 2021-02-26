class Renamecolummn < ActiveRecord::Migration[6.0]
  def change
    rename_column :relationships, :member_id_1, :member_id
    rename_column :relationships, :member_id_2, :relative_id
  end
end
