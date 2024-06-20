class UpdateColumnsToProvider < ActiveRecord::Migration[7.1]
  def change
    remove_column :providers, :country, :integer
    add_reference :providers, :branch, index: true, foreign_key: true
    rename_column :providers, :email, :contact_email
  end
end
