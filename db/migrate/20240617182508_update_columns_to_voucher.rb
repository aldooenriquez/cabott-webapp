class UpdateColumnsToVoucher < ActiveRecord::Migration[7.1]
  def change
    add_column :vouchers, :branched_id, :string
    add_column :vouchers, :payment_tax, :boolean
    add_reference :vouchers, :user, index: true, foreign_key: true
  end
end
