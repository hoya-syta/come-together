class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :title,         presence: true
  validates :detail,        presence: true
  validates :image,         presence: true

  has_many :user_posts
  belongs_to :user
  has_many :users, through: :user_posts
  has_one_attached :image
  has_many :messages, dependent: :destroy
end
