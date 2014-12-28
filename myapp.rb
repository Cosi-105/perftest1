require 'sinatra'
require 'active_record'
require './config/environments'

ENV['RACK_ENV'] ||= 'development'

get '/' do
  erb :index
end
