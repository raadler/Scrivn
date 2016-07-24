class CreateUserInks < ActiveRecord::Migration
  def change
    create_table :user_inks do |t|
      t.belongs_to :ink, null: false
      t.belongs_to :user, null: false
      t.string :color_family
      t.boolean :is_cartridge, null: false, default: false
      t.boolean :is_bottled, null: false, default: false
      t.string :cartridge_size
      t.integer :bottle_size
      t.text :notes
    end
  end
end
