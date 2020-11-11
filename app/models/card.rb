class Card < ApplicationRecord
  belongs_to :user
  has_many :users_tags_relations
  has_many :tags, through: :users_tags_relations
end
