class Tag < ApplicationRecord
  has_many :card_tag_relations
  has_many :cards, through: :card_tag_relations

  validates :tag, uniqueness: true, presence: true
end
