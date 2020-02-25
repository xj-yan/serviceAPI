# entry point
require 'sinatra'
require 'net/http'
require 'uri'
require 'json'

# retrieve your api host address like this
#   settings.api => "someaddress.ondigitalocean.com"
set :api, ENV['API_HOST']
set :api_port, ENV['API_PORT'] || 80

# Show a pretty table of all users... rendered on a html page.
get '/' do
  uri = URI('http://127.0.0.1:4568/users')
  @pre = Net::HTTP.get_response(uri)
  puts @pre
  puts @pre.class
  puts @pre.body.class
  puts @pre.body.length
  JSON.parse(@pre.body)
  # puts @number_of_user
  # puts @number_of_user.class
  # puts @number_of_user.length()
  erb :index, :locals => {:number => 1}
end
