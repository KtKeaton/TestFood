require 'digest'

class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true, length: { minimum: 4 }, presence: true

  has_many :reviews
  has_many :recipes, through: :reviews

  before_create :encrypt_password

  private
  def encrypt_password
    salted_pw = "eiojre#{self.password}rewropwr"
    self.password = Digest::SHA1.hexdigest(salted_pw)
  end
end
