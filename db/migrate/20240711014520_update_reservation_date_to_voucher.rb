class UpdateReservationDateToVoucher < ActiveRecord::Migration[7.1]
  def change
    change_column :vouchers, :reservation_date, :datetime
  end
end
