puts "[]"
configure :production do
  puts "[production]"
	db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

	ActiveRecord::Base.establish_connection(
			:adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
			:host     => db.host,
			:username => db.user,
			:password => db.password,
			:database => db.path[1..-1],
			:encoding => 'utf8')
  require 'newrelic_rpm'
end

configure :development do
  puts "[development]"
  set :database, 'sqlite:///db/development.sqlite3'
end
