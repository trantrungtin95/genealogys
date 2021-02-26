class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.integer :member_id_1
      t.string :relationship_name
      t.integer :member_id_2

      t.timestamps
    end
  end
end
