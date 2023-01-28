class Term < ApplicationRecord
  belongs_to :glossary
  validates :target_term,presence: true
  validates :source_term,presence: true
end
