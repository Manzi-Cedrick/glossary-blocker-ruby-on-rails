class CreateGlossaries < ActiveRecord::Migration[7.0]
  def change
    create_table :glossaries do |t|
      t.string :source_code_lang
      t.string :target_lang_code

      t.timestamps
    end
  end
end
