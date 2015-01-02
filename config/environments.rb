puts "[]"
configure :production do
  puts "[production]"
  ENV['RACK_ENV'] = 'production'
	db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/production')

	ActiveRecord::Base.establish_connection(
			:adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
			:host     => db.host,
			:username => db.user,
			:password => db.password,
			:database => db.path[1..-1],
			:encoding => 'utf8')
end

configure :development do
  ENV['RACK_ENV'] = 'development'
  puts "[development]"
  set :database, 'sqlite:///db/development.sqlite3'
end
