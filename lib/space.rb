require "pg"

class Space
  attr_reader :id, :title, :description, :price, :available_from, :available_to

  def initialize(id:, title:, description:, price:, available_from:, available_to:)
    @id = id
    @title = title
    @description = description
    @price = price
    @available_from = available_from
    @available_to = available_to
  end

  def self.all
    if ENV["ENVIRONMENT"] == "test"
      db = PG.connect(dbname: "makersbnb_test")
    else
      db = PG.connect(dbname: "makersbnb")
    end

<<<<<<< HEAD
    results = db.exec("SELECT * FROM spaces;")
    results.map do |space|
      { title: space["title"], description: space["description"], price: space["price"], user_id: space["user_id"] }
    end
  end

  def self.add(title, description, price, user_id)
=======
    result = db.exec("SELECT * FROM spaces;")
    result.map do |space|
      Space.new(
        id: space["id"],
        title: space["title"],
        description: space["description"],
        price: space["price"],
        available_from: space["available_from"],
        available_to: space["available_to"],
      )
    end
  end

  def self.add(title:, description:, price:, available_from:, available_to:)
    if ENV["ENVIRONMENT"] == "test"
      db = PG.connect(dbname: "makersbnb_test")
    else
      db = PG.connect(dbname: "makersbnb")
    end

    result = db.exec_params("INSERT INTO spaces (title, description, price, available_from, available_to) VALUES($1, $2, $3, $4, $5) RETURNING id, title, description, price, available_from, available_to;", [title, description, price, available_from, available_to])

    Space.new(id: result[0]["id"], title: result[0]["title"], description: result[0]["description"], price: result[0], available_from: result[0]["available_from"], available_to: result[0]["available_to"])
  end

  def self.find(id:)
>>>>>>> f814131d1d878289c6ec52d442bb3b52c8adef5e
    if ENV["ENVIRONMENT"] == "test"
      db = PG.connect(dbname: "makersbnb_test")
    else
      db = PG.connect(dbname: "makersbnb")
    end
<<<<<<< HEAD
    db.exec("INSERT INTO spaces (title, description, price, user_id) VALUES('#{title}', '#{description}', '#{price}', '#{user_id}');")
=======

    result = db.exec_params("SELECT * FROM spaces WHERE id = $1::int;", [id])
    Space.new(id: result[0]["id"], title: result[0]["title"], description: result[0]["description"], price: result[0]["price"], available_from: result[0]["available_from"], available_to: result[0]["available_to"])
>>>>>>> f814131d1d878289c6ec52d442bb3b52c8adef5e
  end
end
