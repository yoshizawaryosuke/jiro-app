class StoreSoup < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '乳化' },
    { id: 2, name: '微乳化' },
    { id: 3, name: '非乳化' }
  ]

  include ActiveHash::Associations
  has_many :stores
end