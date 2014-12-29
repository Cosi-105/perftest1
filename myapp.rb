ENV['RACK_ENV'] ||= 'development'

require 'sinatra'
require 'sinatra/activerecord'

class People < ActiveRecord::Base
end


get '/' do
  erb :index
end

get '/people/count' do
  @count = People.count
  @count.to_json
end

get '/people/sample' do
  bounds = []
  bounds[0] = Random.rand(999999)
  bounds[1] = Random.rand(999999)
  bounds.sort!
  @sample = People.where("random >= :lower AND random < :upper",
                        {lower: bounds[0], upper: bounds[1]})
  @sample.count.to_json
end

