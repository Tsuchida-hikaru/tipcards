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

  def save
    # タグをカンマ起点で配列に分割
    tags = @tag.split(",")

    card = Card.create(title: title, text: text, publish_setting: publish_setting, images: images, user_id: user_id)
    tags.each do |t|
      tag = Tag.where(tag: t).first_or_initialize
      tag.save
      CardTagRelation.create(card_id: card.id, tag_id: tag.id)
    end

  end
end
