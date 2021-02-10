class User < ApplicationRecord

  has_many :lists, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   validates :name, presence: true, length: { maximum: 20 }

  validates :email, presence: true, length: { maximum: 64 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { maximum: 20 }

end
