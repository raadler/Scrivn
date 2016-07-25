class AddFieldsToUserInks < ActiveRecord::Migration
  def change
    add_column :user_inks, :num_bottles, :integer
    add_column :user_inks, :num_cartridges, :integer
    add_column :user_inks, :favorite, :boolean, null: false, default: false
    add_column :user_inks, :will_sell, :boolean, null: false, default: false
  end
end
