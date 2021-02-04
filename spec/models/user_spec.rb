require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '#create' do
    context '新規ユーザー登録が成功するとき' do
      it 'ユーザー名・メールアドレス・公開設定・パスワードが入力されている' do
        expect(@user).to be_valid
      end
    end

    context '新規ユーザー登録が失敗するとき' do
      subject { @user.errors.full_messages }
      it 'ユーザー名が空' do
        @user.name = ''
        @user.valid?
        binding.pry
        expect(@user.errors.full_messages).to include ''
      end
      it 'メールアドレスが空' do
        @user.email = ''
        @user.valid?
        is_expected.to be_valid
      end
      it '公開設定が未設定' do
        @user.publish_setting = ''
        @user.valid?
        is_expected.not_to be_valid
      end
      it 'パスワードが空' do
        @user.password = ''
        @user.valid?
        is_expected.not_to be_valid
      end
    end
  end
end
