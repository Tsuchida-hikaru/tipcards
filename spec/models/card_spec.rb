require 'rails_helper'

RSpec.describe Card, type: :model do
  before do
    @card = FactoryBot.build(:card)
  end
  describe '#create' do
    subject { @card.errors.full_messages }
    it 'タイトルが空のとき' do
      @card.title = ''
      @card.valid?
      is_expected.to include ''
    end
  end
end
