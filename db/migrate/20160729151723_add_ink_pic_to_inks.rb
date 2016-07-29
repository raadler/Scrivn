class AddInkPicToInks < ActiveRecord::Migration
  def change
    add_column :inks, :ink_pic, :string
  end
end
