class AddDateOfBirthToMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :date_of_birth, :date
  end
end
