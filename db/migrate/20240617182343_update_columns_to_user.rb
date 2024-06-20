class UpdateColumnsToUser < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :branch, index: true, foreign_key: true
    add_column :users, :name, :string
  end
end
