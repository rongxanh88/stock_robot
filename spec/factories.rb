FactoryGirl.define do

  factory :historical_date do
    sequence :date do |n|
      "#{DateTime.new + n}"
    end
  end

  factory :security do
    security_type "stock"
  end

  factory :sector do
    sequence :name do |n|
      "Tech#{n}"
    end
  end

  factory :industry do
    sequence :name do |n|
      "Energy#{n}"
    end
  end

  factory :ticker do
    association :security, factory: :security
    association :sector, factory: :sector
    association :industry, factory: :industry

    sequence :symbol do |n|
      "AA#{n}"
    end

    description "AAA company"
  end

  factory :trading_data do
    association :ticker, factory: :ticker
    association :historical_date, factory: :historical_date

    sequence :open do |n|
      "#{n}.#{n}"
    end

    sequence :high do |n|
      "#{n}.#{n}"
    end

    sequence :close do |n|
      "#{n}.#{n}"
    end

    sequence :volume do |n|
      "#{n * 100}"
    end

    sequence :avg_volume do |n|
      "#{n * 100}"
    end

    sequence :week_52_high do |n|
      "#{n}.#{n}"
    end
    sequence :week_52_low do |n|
      "#{n}.#{n}"
    end
  end


end