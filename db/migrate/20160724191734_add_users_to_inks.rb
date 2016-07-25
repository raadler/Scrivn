class AddUsersToInks < ActiveRecord::Migration
  def change
    add_reference :inks, :user, index: true, foreign_key: true
  end
end
