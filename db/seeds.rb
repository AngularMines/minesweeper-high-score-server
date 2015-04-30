require 'faker'

5.times do
  user = User.create(username: Faker::Internet.user_name)
  user.scores.create(score: Faker::Number.number(3))
  # Score.create(score: Faker::Number.number(3))
end


