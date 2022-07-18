FactoryBot.define do
  factory :vessel do
    name { [*'a'..'z', *0..9, *'A'..'Z'].sample(11).join }
    owner_id { [*'a'..'z', *0..9, *'A'..'Z'].sample(5).join }
    naccs_code { random_code }
  end
end

def random_code
  ('a'..'z').to_a.shuffle.join
end
