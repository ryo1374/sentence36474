class TextTagRelation < ApplicationRecord
  belongs_to :text
  belongs_to :tag
end
