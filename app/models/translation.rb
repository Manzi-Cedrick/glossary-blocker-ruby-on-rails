class Translation < ApplicationRecord
  belongs_to :glossary
  validates :source_language_code,presence: true
  validates :target_language_code,presence: true
  validates :source_text,presence: true
  validates :glossary_id, presence: true, allow_nil: true

end
