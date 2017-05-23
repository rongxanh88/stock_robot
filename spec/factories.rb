FactoryGirl.define do

  factory :historical_date do
    sequence :date do |n|
      "#{DateTime.new + n}"
    end
  end


end