class Category < ActiveHash::Base
  self.data = [
    { id: 1,  name: '---' },
    { id: 2,  name: 'ネックレス' },
    { id: 3,  name: 'ブローチ' },
    { id: 4,  name: '帯留め' },
    { id: 5,  name: 'お盆' },
    { id: 6,  name: '絵画' },
    { id: 7,  name: 'その他' },
  ]
  include ActiveHash::Associations
  has_many :items
end