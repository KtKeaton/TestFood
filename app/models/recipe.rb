class Recipe < ApplicationRecord
  belongs_to :user
  has_many :reviews
  #has_many :reviewers, through: :reviews, source: :user #自己命名
  has_many :users
end
