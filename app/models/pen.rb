class Pen < ActiveRecord::Base
  validates :name, presence: true
  validates :manufacturer, presence: true
end
