class CreateTextTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :text_tag_relations do |t|
      t.references :text, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
