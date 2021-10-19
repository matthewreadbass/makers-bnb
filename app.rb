require "sinatra"
require "sinatra/reloader"

class Makersbnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader

    get '/' do
      erb(:sign_up)
    end

    get '/log_in_page' do
      erb(:log_in)
    end

    post '/log_in' do

    end
  end
end
