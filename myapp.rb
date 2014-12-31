ENV['RACK_ENV'] ||= 'development'

require 'sinatra'
require 'sinatra/activerecord'

class People < ActiveRecord::Base
end


get '/' do
  erb :index
end

get '/people' do
  "HellO!"
end

get '/people/count' do
  @count = People.count
  @count.to_json
end

get '/people/sample' do
  lb = Random.rand(999000)
  ub = lb + 5000
  @sample = People.where("random >= :lower AND random < :upper",
                        {lower: lb, upper: ub})
  @sample.to_json
end

