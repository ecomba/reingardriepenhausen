require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'
Dir["lib/**/*.rb"].each {|f| require "./#{f}"}

class Reingard < Sinatra::Base
  helpers Sinatra::Partials

  set :haml, { :format => :html5 }
  set :root, File.dirname(__FILE__)

  helpers do
    include Rack::Utils
    alias_method :h, :escape_html
  end

  get '/' do
    haml :index
  end

  get '/life' do
    haml :life, layout: :gallery_layout
  end

  get '/life_photostack' do 
    puts params['album_name']
    case params['album_name']
    when 'album1'
      '[
        "http://farm5.static.flickr.com/4070/4408430526_fbc4022de4.jpg",
        "http://farm5.static.flickr.com/4058/4407661967_8246d716f9.jpg",
        "http://farm5.static.flickr.com/4062/4407662185_031ee7c570.jpg",
        "http://farm3.static.flickr.com/2758/4407662533_3fea207e6e.jpg",
        "http://farm3.static.flickr.com/2774/4408430168_5079a01a45.jpg",
        "http://farm3.static.flickr.com/2739/4408430378_bab4946e98.jpg",
        "http://farm5.static.flickr.com/4070/4408430526_fbc4022de4.jpg",
        "http://farm5.static.flickr.com/4035/4407663219_53551675e5.jpg",
        "http://farm3.static.flickr.com/2746/4408430822_7ec0f5c1fd.jpg",
        "http://farm3.static.flickr.com/2722/4408430972_b0bb12ac7a.jpg",
        "http://farm3.static.flickr.com/2715/4407663727_3ca99b6038.jpg",
        "http://farm5.static.flickr.com/4047/4408431340_e0158fff9c.jpg",
        "http://farm5.static.flickr.com/4034/4408431562_01c2e1516b.jpg",
        "http://farm5.static.flickr.com/4059/4408431708_a541b009f9.jpg",
        "http://farm3.static.flickr.com/2786/4407664465_fc51c2b7e7.jpg",
        "http://farm3.static.flickr.com/2685/4407664679_1707c1a836.jpg",
        "http://farm5.static.flickr.com/4050/4408417518_5abf4cb9ed.jpg"
      ]'
    when 'album2'
      '[
        "http://farm3.static.flickr.com/2619/4407659309_354d682bde.jpg",
        "http://farm3.static.flickr.com/2492/4407659519_eb57d66755.jpg",
        "http://farm5.static.flickr.com/4070/4407651727_105179420e.jpg",
        "http://farm5.static.flickr.com/4023/4407659725_93d07a7015.jpg",
        "http://farm5.static.flickr.com/4040/4408427486_fa59f52d36.jpg",
        "http://farm5.static.flickr.com/4002/4407660111_ea4e772308.jpg",
        "http://farm3.static.flickr.com/2730/4407650631_5ffddc1fbc.jpg"
      ]'
    when 'album3'
      '[
        "http://farm5.static.flickr.com/4011/4408428034_efe0fde5d2.jpg",
        "http://farm5.static.flickr.com/4052/4407660277_f1c7f25382.jpg",
        "http://farm3.static.flickr.com/2785/4408425262_b3433d80de.jpg",
        "http://farm5.static.flickr.com/4058/4408425478_ee5b1e7518.jpg",
        "http://farm3.static.flickr.com/2745/4408425682_33ca2a6753.jpg",
        "http://farm5.static.flickr.com/4070/4407656725_e831d33c74.jpg",
        "http://farm5.static.flickr.com/4042/4408423112_2b0d098d96.jpg",
        "http://farm5.static.flickr.com/4017/4407655489_a2a64495f0.jpg",
        "http://farm5.static.flickr.com/4028/4408422752_0f6c02c176.jpg",
        "http://farm5.static.flickr.com/4052/4408422574_b802e48902.jpg",
        "http://farm3.static.flickr.com/2717/4407650503_5063284d8c.jpg"
      ]'
    when 'album4'
      '[
      "http://farm5.static.flickr.com/4040/4408420546_f7339569bc.jpg",
      "http://farm5.static.flickr.com/4052/4407649433_643bb0d32e.jpg",
      "http://farm5.static.flickr.com/4072/4407649581_09a19bb5be.jpg",
      "http://farm5.static.flickr.com/4025/4407652441_5604a66bde.jpg",
      "http://farm3.static.flickr.com/2685/4407653031_c5c8995ea3.jpg",
      "http://farm5.static.flickr.com/4019/4408420992_865cc1d6f7.jpg",
      "http://farm5.static.flickr.com/4011/4408421152_74be0d7321.jpg",
      "http://farm3.static.flickr.com/2795/4407653899_118a9c3b03.jpg",
      "http://farm5.static.flickr.com/4044/4408421692_214bc24104.jpg",
      "http://farm5.static.flickr.com/4027/4407654585_08fb902dbf.jpg",
      "http://farm5.static.flickr.com/4011/4407654731_d4db5ff031.jpg",
      "http://farm5.static.flickr.com/4001/4407656537_c7c60a81fb.jpg",
      "http://farm5.static.flickr.com/4042/4407658437_5b2d06aaf2.jpg",
      "http://farm5.static.flickr.com/4022/4408426432_dde9303e07.jpg"
      ]'
    else
      "[]"
    end
  end

  get '/stylesheets/:name.css' do
    content_type 'text/css', :charset => 'utf-8'
    scss :"stylesheets/#{params[:name]}"
  end

end
