require 'rubygems'
require 'sinatra'
require 'environment'

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

get '/:folder/:slide' do
  @folder = params[:folder]
  @slide = params[:slide]
  haml :slide, :layout => :'layout'
end

get '/' do
  @page_name = params[:page_name]
  haml :index, :layout => :'layout'
end
