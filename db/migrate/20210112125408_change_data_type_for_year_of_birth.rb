class ChangeDataTypeForYearOfBirth < ActiveRecord::Migration[6.0]
  def change
    change_column :members, :year_of_birth, :integer
  end
end
