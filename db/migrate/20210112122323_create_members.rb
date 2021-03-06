class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.integer :family_id
      t.string :name
      t.integer :year_of_birth

      t.timestamps
    end
  end
end
