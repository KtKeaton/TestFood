class Recipe < ApplicationRecord
  has_many :reviews
  #has_many :reviewers, through: :reviews, source: :user #自己命名
  belongs_to :user
end
