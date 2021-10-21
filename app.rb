require "sinatra"
require "sinatra/reloader"
require "./lib/user"
require "./lib/space"

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
      connection = PG.connect(dbname: "makersbnb")
      @result = connection.exec("SELECT EXISTS(SELECT * FROM users WHERE email='#{@email}');")
      if @result.column_values(0).include?("t") == false
        User.create(@name, @email, @password)
        "You have created an account"
      else
        "Email already in use"
      end
    end
  end

  get "/list_space" do
    erb(:list_space)
  end

  post "/add_space" do
    Space.add(title: params[:title], description: params[:description], price: params[:price], available_from: params[:start_date], available_to: params[:end_date])
    redirect("/spaces")
  end

  get "/spaces" do
    @spaces = Space.all
    erb(:spaces)
  end

  get "/spaces/:id" do
    @space = Space.find(id: params[:id])
    erb(:request)
  end
end
