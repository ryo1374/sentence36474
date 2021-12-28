class Type < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'カジュアル' },
    { id: 3, name: 'フォーマル' },
  ]

  include ActiveHash::Associations
  has_many :texts

  end