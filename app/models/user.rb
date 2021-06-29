class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :first_name, length: { minimum: 2 }
  validates :email, presence: true
  validates :email, length: { minimum: 5 }
  validates :password, length: { minimum: 8 }

  has_secure_password
  has_many :todos
end
