require 'rubygems'
require "bundler/setup"
require "sinatra" unless defined?(Sinatra)
Bundler.require(:default, Sinatra::Base.environment)
require 'models/email'
require 'rack-flash'

use Rack::Flash
enable :sessions

AppConfig=YAML::load File.new("config.yml").read

configure :development do
  DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/email.db")
  DataMapper::Logger.new($stdout, :debug)
end

configure :production do
  DataMapper.setup(:default, ENV['DATABASE_URL'] || 'sqlite3://email.db')
end

def requires_authorization!
  unless authorized?
    response['WWW-Authenticate'] = %(Basic realm="Testing HTTP Auth")
    throw(:halt, [401, "Not authorized\n"])
  end
end

def authorized?
  @auth ||=  Rack::Auth::Basic::Request.new(request.env)
  @auth.provided? && @auth.basic? && @auth.credentials == [ AppConfig['credentials']['user'], AppConfig['credentials']['password']]
end