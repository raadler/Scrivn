class CreateInks < ActiveRecord::Migration
  def change
    create_table :inks do |t|
      t.string :color_name, null: false, default: "unnamed ink"
      t.string :manufacturer
      t.text :notes
    end
  end
end
