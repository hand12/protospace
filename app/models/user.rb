class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :products
  has_many :likes
  has_many :comments

  validates :name, presence: true
  validates :email, presence: true

  mount_uploader :avatar, ImageUploader
end
