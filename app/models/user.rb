class User < ActiveRecord::Base
  validates :first_name, { presence: true, length: { minimum: 2 } }
  validates :email, { presence: true, length: { minimum: 5 }, uniqueness: true }
  validates :password, length: { minimum: 8 }

  has_secure_password
  has_many :todos
end
