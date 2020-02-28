# entry point
require 'sinatra'
require 'faker'

require_relative './models/user'

# Retrieve all users from database.
get '/users' do
  {
    response: User.all,
  }.to_json
end

# Create n users.
post '/users' do
  count = params[:n].to_i || 1
  if count > 30
    status 400
    return
  end

  if count == 0
    count = 1
  end
  count.times.each do |x|
      User.create(name: Faker::Name.name, email: Faker::Internet.email, bio: Faker::Job.title, password: Faker::Internet.password(min_length: 10, max_length: 20))
  end

  status 200
end

# Delete all users.
post '/users/destroy' do
  if User.delete_all
    status 200
  else
    status 500
  end
end
