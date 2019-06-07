class User < ApplicationRecord
  has_secure_password
  has_many :products, dependent: :destroy

  validates :username, :email, :password_digest, presence: true
end
