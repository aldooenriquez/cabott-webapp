class AddCommentToVoucher < ActiveRecord::Migration[7.1]
  def change
    add_column :vouchers, :comment, :text
    add_column :vouchers, :reservation_date, :date, null: false
  end
end
