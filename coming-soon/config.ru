require 'app'
DataMapper.auto_migrate!	#comment this line after first push to heroku
run Sinatra::Application