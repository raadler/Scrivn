class Removeuserfrominks < ActiveRecord::Migration
  def change
    remove_reference :inks, :user, index: true, foreign_key: true
  end
end
