class CardTag
  include ActiveModel::Model
  attr_accessor :title, :text, :publish_setting, :images, :user_id, :tag

  with_options presence: true do
    validates :title
    validates :text
    validates :publish_setting
    validates :user_id
    validates :tag
  end

  def update_name
    self.tag = @tag
  end

  def save
    tag = @tag
    card = Card.create(title: title, text: text, publish_setting: publish_setting, images: images, user_id: user_id)
    tag = Tag.where(tag: tag).first_or_initialize
    tag.save

    CardTagRelation.create(card_id: card.id, tag_id: tag.id)
  end
end
