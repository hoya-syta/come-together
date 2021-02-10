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

    with_options presence: true do
      validates :nickname
      validates :birthday
      validates :password, length: { minimum: 6 },
                           format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  
      with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
        validates :last_name
        validates :first_name
      end
  
      with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
        validates :last_name_hurigana
        validates :first_name_hurigana
      end
    end

end