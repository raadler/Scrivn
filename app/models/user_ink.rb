class UserInk < ActiveRecord::Base
  validates :is_cartridge, inclusion: { in: [true, false] }
  validates :is_bottled, inclusion: { in: [true, false] }
  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :ink_id, presence: true, numericality: { only_integer: true }

  belongs_to :user
  belongs_to :ink
end
