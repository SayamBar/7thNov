FactoryBot.define do
  factory :article do
    title {"A"}
    # body {"abc"}
    trait :rewinding do
      body {'Sequences can also be rewound with FactoryBot.rewind_sequences:'}
    end

    trait :uniqueness do
      body {'When working with uniqueness constraints, be careful not to pass in override values that will conflict with the generated sequence values.'}
    end

    writer {"Writer"}
  end

  factory :comment do
    commenter {"Commenter"}
    body {"Comment"}
  end

  factory :user do
    email {"example@gmail.com"}
    password {"password"}
  end

  # factory :user do
end
