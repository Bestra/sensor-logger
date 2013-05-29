FactoryGirl.define do

  factory :user do
    email "user@example.com"
    password "12password"
  end

  factory :sensor do

  end

  factory :project do
    name "A project"
    description "Measure things"

  end

  factory :sensor_data do

  end
end
