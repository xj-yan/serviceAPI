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
  # uri = URI('http://127.0.0.1:4568/users')
  uri = URI.join("http://#{settings.api}:#{settings.api_port}","users")
  response = Net::HTTP.get(uri)
  h = JSON.parse(response)
  
  erb :index, :locals => {:users => h['response']}
end

post '/users' do
  uri = URI.join("http://#{settings.api}:#{settings.api_port}","users")
  Net::HTTP.post_form(uri, 'n' => params["n"])
  redirect '/'
end
