10.times do
  Post.create(title: Faker::Lorem.question)
end