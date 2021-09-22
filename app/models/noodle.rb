class Noodle < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '硬め（ゴワ麺）' },
    { id: 2, name: '普通' },
    { id: 3, name: '柔らかめ（デロ麺）' }
  ]

  include ActiveHash::Associations
  has_many :stores
end
