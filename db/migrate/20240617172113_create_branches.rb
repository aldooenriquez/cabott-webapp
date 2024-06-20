class CreateBranches < ActiveRecord::Migration[7.1]
  def change
    create_table :branches do |t|
      t.string :name
      t.string :code, null: false
      t.string :state
      t.integer :country

      t.timestamps
    end
    add_index :branches, :code, unique: true
  end
end
