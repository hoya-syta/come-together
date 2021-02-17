class Post < ApplicationRecord

  validates :title,         presence: true
  validates :detail,        presence: true
  validates :image,         presence: true

  has_many :user_posts
  has_many :users, through: user_posts
  has_one_attached :image
end
