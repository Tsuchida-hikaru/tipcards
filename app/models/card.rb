class Card < ApplicationRecord
  belongs_to :user
  has_many :users_tags_relations
  has_many :tags, through: :users_tags_relations
  has_many_attached :images

  with_options presence: true do
    validates :title, length: { maximum: 30, message: "は３０文字以内で記入してください"}
    validates :text, length: { maximum: 140, message: "は１４０文字以内で記入してください"}
    validates :publish_setting
  end
end
