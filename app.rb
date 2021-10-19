require "sinatra"
require "sinatra/reloader"

class Makersbnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
end
