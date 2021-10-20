require "sinatra"
require "sinatra/reloader"
require "pg"

class Makersbnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  get "/" do
    erb(:sign_up)
  end

  get "/log_in_page" do
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
    connection = PG.connect(dbname: 'makersbnb') 
    connection.exec("INSERT INTO users (first_name, email, password) VALUES ('#{@name}','#{@email}','#{@password}');")
    "You have created an account"
    end
  end
end
