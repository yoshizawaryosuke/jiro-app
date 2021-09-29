class StoreMeat < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '赤身多め（ギュチ豚）' },
    { id: 2, name: '普通' },
    { id: 3, name: '脂身多め（トロ豚）' }
  ]

  include ActiveHash::Associations
  has_many :stores
end