class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :age
    belongs_to :gender
    belongs_to :perfecture
    belongs_to :profession


end