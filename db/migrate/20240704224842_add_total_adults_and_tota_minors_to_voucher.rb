class AddTotalAdultsAndTotaMinorsToVoucher < ActiveRecord::Migration[7.1]
  def change
    add_column :vouchers, :total_adults, :integer, :null => false, :default => 1
    add_column :vouchers, :total_minors, :integer, :null => false, :default => 0
  end
end
