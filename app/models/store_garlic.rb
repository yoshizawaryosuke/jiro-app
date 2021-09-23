class StoreGarlic < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '辛い（辛ニンニク）' },
    { id: 2, name: '普通' },
    { id: 3, name: 'マイルド' }
  ]
  
  include ActiveHash::Associations
  has_many :stores
  end