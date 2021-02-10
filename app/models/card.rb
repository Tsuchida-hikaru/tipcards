class Card < ApplicationRecord
  belongs_to :user
  has_many :card_tag_relations, dependent: :destroy
  has_many :tags, through: :card_tag_relations
  has_many_attached :images

  with_options presence: true do
    validates :title, length: { maximum: 30, message: 'は３０文字以内で記入してください' }
    validates :text, length: { maximum: 300, message: 'は３００文字以内で記入してください' }
    validates :publish_setting
  end
end
