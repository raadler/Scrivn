class Ink < ActiveRecord::Base
  validates :color_name, presence: true
end
