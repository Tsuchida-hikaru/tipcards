FactoryBot.define do
  factory :user do
    id { 1 }
    name { 'testarou' }
    email { 'test@test.com' }
    password { 'testuser' }
    publish_setting { 'false' }
  end
end
