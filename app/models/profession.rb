class Profession < ActiveHash::Base
  self.data = [
    { id: 1, name: '選択してください' },
    { id: 2, name: '公務員' },
    { id: 3, name: '経営者・役員' },
    { id: 4, name: '会社員' },
    { id: 5, name: '自営業' },
    { id: 6, name: '自由業' },
    { id: 7, name: '専業主婦' },
    { id: 8, name: 'パート・アルバイト' },
    { id: 9, name: '学生' },
    { id: 10, name: 'その他' },
  ]

include ActiveHash::Associations
  belongs_to :user
end
