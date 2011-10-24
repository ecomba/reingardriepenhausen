require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'
Dir["lib/**/*.rb"].each {|f| require "./#{f}"}

class Reingard < Sinatra::Base
  helpers Sinatra::Partials

  set :haml, { :format => :html5 }
  set :root, File.dirname(__FILE__)

  configure :development do
    require "sinatra/reloader"
  end

  configure :production do
    set :haml, { :ugly => true }
  end

  helpers do
    include Rack::Utils
    alias_method :h, :escape_html
  end

  get '/' do
    haml :index
  end

  get '/stylesheets/:name.css' do
    content_type 'text/css', :charset => 'utf-8'
    scss :"stylesheets/#{params[:name]}"
  end

end
