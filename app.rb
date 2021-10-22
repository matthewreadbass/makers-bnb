require "sinatra"
require "sinatra/reloader"
require "sinatra/flash"
require "./lib/user"
require "./lib/space"

class Makersbnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    register Sinatra::Flash
  end
  enable :sessions

  get "/" do
    erb(:sign_up)
  end

  get "/log_in_page" do
    erb(:log_in)
  end

  post "/log_in" do
    flash[:notice] = "Successfully logged in!"
    redirect("/spaces")
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
        flash[:notice] = "Successfully signed up. Please log in."
        redirect("/log_in_page")
      else
        "<h1>Email already in use! Please choose another one, otherwise login to your account <a href='/log_in_page'>here</a>.</h1>"
      end
    end
  end

  get "/list_space" do
    erb(:list_space)
  end

  post "/add_space" do
    Space.add(title: params[:title], description: params[:description], price: params[:price], available_from: params[:start_date], available_to: params[:end_date])
    flash[:notice] = "Your #{params[:title]} space has now been listed."
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

  post "/requests" do
    flash[:notice] = "The request to the host has been sent."
    redirect("/spaces")
  end
end
