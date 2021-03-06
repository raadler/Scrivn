class User < ActiveRecord::Base
  attr_accessor :login, :avatar, :avatar_cache, :remove_avatar
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :user_inks
  has_many :inks, through: :user_inks
  has_many :user_inks, dependent: :destroy
end
