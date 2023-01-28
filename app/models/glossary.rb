class Glossary < ApplicationRecord
    validates :source_code_lang,presence: true,uniqueness: true
    validates :target_lang_code,presence: true
end
