require "sinatra"
require "sinatra/reloader"
require "./lib/user"

class Makersbnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  get "/" do
    erb(:sign_up)
  end

  get "/log_in_page" do
    @email = params[:email]
    @password = params[:password]
    users = User.all
    users.each do |user|
      if user[:email] == @email && user[:password] == @password
        # redirect("/log_in")
        p "Correct"
      else
        p "Wrong credentials"
      end
    end
    erb(:log_in)
  end

  post "/log_in" do
    "Welcome"
  end

  post "/sign_up" do
    if params[:password] != params[:password2]
      # erb(:passwords_dont_match)
      "Error, passwords do not match"
    else
      @name = params[:name]
      @email = params[:email]
      @password = params[:password]
      User.create(@name, @email, @password)
      "You have created an account"
    end
  end
end
