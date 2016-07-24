class UserInk < ActiveRecord::Base
  validates :is_cartridge, presence: true
  validates :is_bottled, presence: true
  validates :bottle_size, numericality: { only_integer: true }
  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :ink_id, presence: true, numericality: { only_integer: true }

  belongs_to :user
  belongs_to :ink
end
