class ChangeBottleSizeToString < ActiveRecord::Migration
  def up
    remove_column :user_inks, :bottle_size
    add_column :user_inks, :bottle_size, :string
  end
  def down
    remove_column :user_inks, :bottle_size
    add_column :user_inks, :bottle_size, :integer
  end
end
