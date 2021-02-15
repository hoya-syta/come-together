class Age < ActiveHash::Base
  self.data = [
    { id: 1, name: '選択してください' },
    { id: 2, name: '20歳未満' },
    { id: 3, name: '20-29歳' },
    { id: 4, name: '30-39歳' },
    { id: 5, name: '40-49歳' },
    { id: 6, name: '50-59歳' },
    { id: 7, name: '60-69歳' },
    { id: 8, name: '70-79歳' },
    { id: 9, name: '80歳以上' },
    { id: 10, name: 'その他' },
  ]

include ActiveHash::Associations
  belongs_to :user
end

