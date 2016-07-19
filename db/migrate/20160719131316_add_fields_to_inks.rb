class AddFieldsToInks < ActiveRecord::Migration
  def change
    change_column_null :inks, :manufacturer, false
    add_column :inks, :line, :string
    rename_column :inks, :notes, :description
  end
end
