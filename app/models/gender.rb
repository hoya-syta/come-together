class Gender < ActiveHash::Base
  self.data = [
    { id: 1, name: '選択してください' },
    { id: 2, name: '男性' },
    { id: 3, name: '女性' },
  ]

include ActiveHash::Associations
  belongs_to :user
end

