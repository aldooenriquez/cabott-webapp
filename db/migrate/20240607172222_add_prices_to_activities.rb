class AddPricesToActivities < ActiveRecord::Migration[7.1]
  def change
    add_column :activities, :entity, :string
    add_column :activities, :provider_price, :decimal
    add_column :activities, :public_price, :decimal
  end
end
