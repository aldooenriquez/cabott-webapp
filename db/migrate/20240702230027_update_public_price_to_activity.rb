class UpdatePublicPriceToActivity < ActiveRecord::Migration[7.1]
  def change
    add_column :activities, :public_minor_price, :decimal
    add_column :activities, :provider_minor_price, :decimal
    rename_column :activities, :public_price, :public_general_price
    rename_column :activities, :provider_price, :provider_general_price
  end
end
