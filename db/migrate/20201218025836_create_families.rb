class CreateFamilies < ActiveRecord::Migration[6.0]
  def change
    create_table :families do |t|
      t.string :surname
      t.string :address
      t.integer :member, default: 0
      t.text :infor

      t.timestamps
    end
  end
end
