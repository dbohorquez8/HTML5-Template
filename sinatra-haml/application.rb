require 'rubygems'
require 'sinatra'
require 'environment'

mime_type :ttf, "application/octet-stream"
mime_type :woff, "application/octet-stream"

configure do
  set :views, "#{File.dirname(__FILE__)}/views"
  set :public, "#{File.dirname(__FILE__)}/public"
end

error do
  e = request.env['sinatra.error']
  Kernel.puts e.backtrace.join("\n")
  'Application error'
end

helpers do
  def partial(template, options = {})
    options.merge!(:layout => false)
    haml("shared/#{template}".to_sym, options)
  end
end

get '/shared/:page_name' do
  @page_name = params[:page_name]
  haml "shared/#{@page_name}".to_sym, :layout => false
end

get '/:folder/:page_name' do
  @page_name = params[:page_name]
  @folder = params[:folder]
  haml "#{@folder}/#{@page_name}".to_sym, :layout => :'layouts/main'
end

get '/:page_name' do
  @page_name = params[:page_name]
  haml @page_name.to_sym, :layout => :'layouts/main'
end

get '/' do
  @page_name = 'home'
  haml :index, :layout => :'layouts/main'
end
