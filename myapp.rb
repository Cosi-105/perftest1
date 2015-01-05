ENV['RACK_ENV'] ||= 'development'

require 'sinatra'
require 'sinatra/activerecord'
require_relative './helpers/html_helpers'

require 'newrelic_rpm'

class People < ActiveRecord::Base
end

get '/' do
  erb :index
end

get '/people' do
	@count = People.count
  erb :people
end

get '/people/sample' do
  lb = Random.rand(999000)
  ub = lb + 5000
  @sample = People.where("random >= :lower AND random < :upper",
                        {lower: lb, upper: ub})
  @sample.to_json
end

get '/people/sample/indexed/:count' do
	binding.pry
	count = params[:count].to_i
	@sample = sample_people_indexed(count)
	@sample.to_json
end

get '/people/sample/noindex/:count' do
	count = params[:count].to_i
	@sample = sample_people_noindex(count)
  @sample.to_json
end

def sample_people_noindex(count)
	lb = Random.rand(999000)
  ub = lb + count
  @sample = People.where("random >= :lower AND random < :upper",
                        {lower: lb, upper: ub})
end

def sample_people_indexed(count)
	lb = Random.rand(999000)
  ub = lb + count
  @sample = People.where("random >= :lower AND random < :upper",
                        {lower: lb, upper: ub})
end

