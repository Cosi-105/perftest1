require 'sinatra'

configure :production do
  require 'newrelic_rpm'
end

get '/' do
  erb :index
end
