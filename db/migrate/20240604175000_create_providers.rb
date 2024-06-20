class CreateProviders < ActiveRecord::Migration[7.1]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :email
      t.integer :country

      t.timestamps
    end
  end
end
