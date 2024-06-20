class CreateVouchers < ActiveRecord::Migration[7.1]
  def change
    create_table :vouchers, id: false do |t|
      t.string :id, null: false
      t.string :contact_name
      t.string :contact_email
      t.references :activity, null: false, foreign_key: true
      t.integer :status
      t.integer :payment_type
      t.decimal :total, :null => false

      t.timestamps
    end
    add_index :vouchers, :id, unique: true
  end
end
