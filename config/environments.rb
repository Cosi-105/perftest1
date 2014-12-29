puts "[]"
configure :production do
  puts "[production]"
  db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
  set :database, db
  require 'newrelic_rpm'
end

configure :development do
  puts "[development]"
  set :database, 'sqlite:///db/development.sqlite3'
end
