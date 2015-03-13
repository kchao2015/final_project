class User < ActiveRecord::Base
  has_secure_password
  
  has_many :trips

  validates :email, presence: true
  validates :name, presence: true
end
