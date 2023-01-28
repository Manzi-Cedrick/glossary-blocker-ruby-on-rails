class CreateTranslations < ActiveRecord::Migration[7.0]
  def change
    create_table :translations do |t|
      t.string :source_language_code
      t.string :target_language_code
      t.text :source_text
      t.belongs_to :glossary, null: false, foreign_key: true

      t.timestamps
    end
  end
end
