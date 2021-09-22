class Oil < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '多め' },
    { id: 2, name: '普通' },
    { id: 3, name: '少なめ' }
  ]
  
  include ActiveHash::Associations
  has_many :stores
  end