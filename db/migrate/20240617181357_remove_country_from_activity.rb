class RemoveCountryFromActivity < ActiveRecord::Migration[7.1]
  def change
    remove_column :activities, :country, :integer
    remove_column :activities, :entity, :integer
  end
end
