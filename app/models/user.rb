class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,
  :timeoutable

  validates :first_name, :last_name, presence: true, length: { maximum: 30, minimum: 3 }
  validates :email, email: {mode: :strict}, length: { maximum: 50, minimum: 7 }
end
