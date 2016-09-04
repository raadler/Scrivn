class CreatePens < ActiveRecord::Migration
  def change
    create_table :pens do |t|
      t.string :name, null: false, default: "unnamed pen"
      t.string :manufacturer
      t.text :description
      t.string :line
      t.text :filling_mechanism
    end
  end
end
