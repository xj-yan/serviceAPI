require 'faker'

10.times.each do |x|
    User.create(name: Faker::Name.name, email: Faker::Internet.email, bio: Faker::Job.title, password: Faker::Internet.password(min_length: 10, max_length: 20))
end