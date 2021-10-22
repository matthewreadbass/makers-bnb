require "pg"

class Space
  attr_reader :id, :title, :description, :price, :user_id

  def initialize(id:, title:, description:, price:, user_id:)
    @id = id
    @title = title
    @description = description
    @price = price
    @user_id = user_id
  end

  def self.all
    if ENV["ENVIRONMENT"] == "test"
      db = PG.connect(dbname: "makersbnb_test")
    else
      db = PG.connect(dbname: "makersbnb")
    end
    result = db.exec("SELECT * FROM spaces;")
    result.map do |space|
      { title: space["title"], description: space["description"], price: space["price"] }
    end
  end

  # Nice-to-have: Auto-populate user_id instead of user having to fill out
  def self.add(title:, description:, price:, user_id:)
    if ENV["ENVIRONMENT"] == "test"
      db = PG.connect(dbname: "makersbnb_test")
    else
      db = PG.connect(dbname: "makersbnb")
    end
    result = db.exec_params("INSERT INTO spaces (title, description, price, user_id) VALUES($1, $2, $3, $4) RETURNING id, title, description, price, user_id;", [title, description, price, user_id])
    Space.new(id: result[0]["id"], title: result[0]["title"], description: result[0]["description"], price: result[0]["price"], user_id: result[0]["user_id"])
  end

  def self.find(id:)
    if ENV["ENVIRONMENT"] == "test"
      db = PG.connect(dbname: "makersbnb_test")
    else
      db = PG.connect(dbname: "makersbnb")
    end
    result = db.exec_params("SELECT * FROM spaces WHERE id = $1::int;", [id])
    Space.new(id: result[0]["id"], title: result[0]["title"], description: result[0]["description"], price: result[0]["price"], user_id: result[0]["user_id"])
  end
end
