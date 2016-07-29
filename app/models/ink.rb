class Ink < ActiveRecord::Base
  validates :color_name, presence: true
  validates :manufacturer, presence: true

  has_many :user_inks
  has_many :users, through: :user_inks

  mount_uploader :ink_pic, InkPicUploader
end
