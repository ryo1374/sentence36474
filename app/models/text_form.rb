class TextForm
  include ActiveModel::Model


  attr_accessor( :sentence, :translate, :remarks, :type_id, :user_id, 
                 :id, :created_at, :datetime, :updated_at, :datetime,
                 :tag_name
  )

  with_options presence: true do 
    validates :sentence
    validates :translate
    validates :type_id
  end

  def save
    text = Text.create(sentence: sentence, translate: translate, remarks: remarks, type_id: type_id, user_id: user_id)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save
    TextTagRelation.create(text_id: text.id, tag_id: tag.id)
  end

 
end