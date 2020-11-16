class Tag < ApplicationRecord
  has_many :users_tags_relations
  has_many :cards, through: :users_tags_relations
end
