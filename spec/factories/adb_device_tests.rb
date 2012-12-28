# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :adb_device_test do
    name "MyString"
    script "MyText"
    device_id 1
    upload_id 1
    company_id 1
  end
end
