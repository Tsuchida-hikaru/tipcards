require 'rails_helper'

RSpec.describe Card, type: :model do
  before do
    @card = FactoryBot.build(:card)
  end

  describe '#create' do
    context '新規投稿出来るとき' do
      it 'タイトル・本文・公開設定の入力内容が満たされているとき' do
        expect(@card).to be_valid
      end
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
      it 'タイトルが３１文字以上のとき（全角）' do
        @card.title = '１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１'
        @card.valid?
        is_expected.to include 'タイトルは３０文字以内で記入してください'
      end
      it 'タイトルが３１文字以上のとき（半角）' do
        @card.title = '1234567890123456789012345678901'
        @card.valid?
        is_expected.to include 'タイトルは３０文字以内で記入してください'
      end
      it '本文が３０１文字以上のとき' do
        @card.text = '１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１'
        @card.valid?
        is_expected.to include '本文は３００文字以内で記入してください'
      end
    end
  end
end
