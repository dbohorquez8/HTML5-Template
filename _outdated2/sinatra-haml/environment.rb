require "rubygems"
require "bundler/setup"
Bundler.require(:default, Sinatra::Base.environment)

require "sinatra" unless defined?(Sinatra)
