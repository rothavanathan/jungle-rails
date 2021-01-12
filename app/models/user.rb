class User < ActiveRecord::Base
  has_secure_password
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true 
  validates :email, presence: true
  validates :password, length: { minimum: 5 }
  
  attr_accessor :first_name, :last_name
  
end
