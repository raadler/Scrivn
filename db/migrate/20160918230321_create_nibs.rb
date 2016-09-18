class CreateNibs < ActiveRecord::Migration
  def change
    create_table :nibs do |t|
      t.string :nib_size
      t.string :nib_type, null: false, default: 'normal'
    end
  end
end
