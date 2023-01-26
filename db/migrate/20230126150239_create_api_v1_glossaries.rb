class CreateApiV1Glossaries < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_glossaries do |t|
      t.string :source_lang_code
      t.string :target_lang_code
      t.timestamps
    end
  end
end
