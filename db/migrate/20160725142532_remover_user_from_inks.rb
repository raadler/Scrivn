class RemoverUserFromInks < ActiveRecord::Migration
  def up
    remove_reference :inks, :user, index: true, foreign_key: true
  end

  def down
    add_reference :inks, :user, index: true, foreign_key: true
  end
end
