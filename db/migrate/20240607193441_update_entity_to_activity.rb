class UpdateEntityToActivity < ActiveRecord::Migration[7.1]
  def change
    change_column :activities, :entity, :integer
  end
end
