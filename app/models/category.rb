class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'メンズ' },
    { id: 3, name: 'レディース' },
    { id: 4, name: 'ベビー' },
    { id: 5, name: 'キッズ' },
    { id: 6, name: 'インテリア' },
    { id: 7, name: '住まい' },
    { id: 8, name: '小物' },
    { id: 9, name: '本' },
    { id: 10, name: '音楽' }、
    { id: 11, name: 'ゲーム' }
  ]

  include ActiveHash::Associations
  has_many :items
  end