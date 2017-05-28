FactoryGirl.define do
  factory :ticker_tag do
    association :ticker, factory: :ticker
    association :tag, factory: :tag
  end

  factory :tag do
    sequence :title do |n|
      "Title#{n}"
    end
  end

  factory :user do
    sequence :email_address do |n|
      "person#{n}@mail.com"
    end

    password "password"

    role 0
  end

  factory :historical_date do
    date "most recent day"
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