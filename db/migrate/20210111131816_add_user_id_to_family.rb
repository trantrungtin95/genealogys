class AddUserIdToFamily < ActiveRecord::Migration[6.0]
  def change
    add_column :families, :user_id, :integer
  end
end
