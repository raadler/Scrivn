class RemoveConstraintsFromUserInks < ActiveRecord::Migration
  def up
    change_column :user_inks, :is_bottled, :boolean, :null => true
    change_column :user_inks, :is_cartridge, :boolean, :null => true
    change_column :user_inks, :favorite, :boolean, :null => true
    change_column :user_inks, :will_sell, :boolean, :null => true
  end
  def down
    change_column :user_inks, :is_bottled, :boolean, :null => false
    change_column :user_inks, :is_cartridge, :boolean, :null => false
    change_column :user_inks, :favorite, :boolean, :null => false
    change_column :user_inks, :will_sell, :boolean, :null => false
  end
end
