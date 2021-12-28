class Tag < ApplicationRecord
 

  has_many :text_tag_relations, dependent: :destroy
  has_many :texts, through: :text_tag_relations

  validates :tag_name, presence: true, uniqueness: true
  def self.search(search)
    if search != '#'
      Tag.where('sentence LIKE(?)', "%#{search}%")
      
    else
      Text.all
    end
  end

end
