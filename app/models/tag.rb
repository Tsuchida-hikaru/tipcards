class Tag < ApplicationRecord
  has_many :cards_tags_relations
  has_many :cards, through: :cards_tags_relations
end
