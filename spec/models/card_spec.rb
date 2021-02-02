require 'rails_helper'

RSpec.describe Card, type: :model do
  before do
    @card = FactoryBot.build(:card)
  end

  describe '#create' do
    context '新規投稿出来るとき' do
    end
    context '新規投稿出来ないとき' do
      subject { @card.errors.full_messages }
      it 'タイトルが空のとき' do
        @card.title = ''
        @card.valid?
        is_expected.to include 'タイトルを入力してください'
      end
      it '本文が空のとき' do
        @card.text = ''
        @card.valid?
        is_expected.to include '本文を入力してください'
      end
      it '公開設定が未設定のとき' do
        @card.publish_setting = ''
        @card.valid?
        is_expected.to include '公開設定を入力してください'
      end
    end
  end
end
