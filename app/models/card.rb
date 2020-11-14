class Card < ApplicationRecord
  belongs_to :user
  has_many :users_tags_relations
  has_many :tags, through: :users_tags_relations
  has_one_attached :image

  with_options presence: true do
    validates :title, length: { maximum: 30}
    validates :text
  end
end
