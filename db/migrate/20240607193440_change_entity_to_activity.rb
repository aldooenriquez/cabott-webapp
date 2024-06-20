class ChangeEntityToActivity < ActiveRecord::Migration[7.1]
  def change
    change_column :activities, :entity, :decimal
  end
end
