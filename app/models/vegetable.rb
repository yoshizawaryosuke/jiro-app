class Vegetable < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '硬め（シャキ野菜）' },
    { id: 2, name: '普通' },
    { id: 3, name: '柔らかめ（デロ野菜）' }
  ]

  include ActiveHash::Associations
  has_many :stores
end