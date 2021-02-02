FactoryBot.define do
  factory :card do
    title           { 'タイトル' }
    text            { '本文' }
    publish_setting { true }
    association :user
  end
end
