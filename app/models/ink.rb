class Ink < ActiveRecord::Base
  validates :color_name, presence: true
  validates :manufacturer, presence: true

  belongs_to :user
end
