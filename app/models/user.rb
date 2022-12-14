class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :employee_number, presence: true, length: { is: 3 }

  has_many :post_users
  has_many :posts, through: :post_users
  has_many :messages
  has_many :destination
end
