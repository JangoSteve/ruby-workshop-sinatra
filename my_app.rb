# You'll need to require these if you
# want to develop while running with ruby.
# The config/rackup.ru requires these as well
# for it's own reasons.
#
# $ ruby heroku-sinatra-app.rb
#
require 'rubygems'
require 'sinatra'

require './config/init.rb'

# Quick test
get '/' do
  @users = User.all
  haml :index
end

post '/user' do
  @user = User.create(:name => params[:name], :email => params[:email])
  redirect to('/')
end

# Test at <appname>.heroku.com

# You can see all your app specific information this way.
# IMPORTANT! This is a very bad thing to do for a production
# application with sensitive information

# get '/env' do
#   ENV.inspect
# end
