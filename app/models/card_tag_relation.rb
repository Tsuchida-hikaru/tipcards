class CardTagRelation < ApplicationRecord
    belongs_to :card
    belongs_to :tag
end
