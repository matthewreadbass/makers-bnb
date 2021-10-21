require "pg"

class Space
  def self.all
    if ENV["ENVIRONMENT"] == "test"
      db = PG.connect(dbname: "makersbnb_test")
    else
      db = PG.connect(dbname: "makersbnb")
    end

    results = db.exec("SELECT * FROM spaces;")
    results.map { |space| { title: space["title"], description: space["description"], price: space["price"], available_from: space["available_from"], available_to: space["available_to"], availablity: space["available"] } }
  end

  def self.add(title, description, price, available_from, available_to)
    if ENV["ENVIRONMENT"] == "test"
      db = PG.connect(dbname: "makersbnb_test")
    else
      db = PG.connect(dbname: "makersbnb")
    end

    db.exec("INSERT INTO spaces (title, description, price, available_from, available_to) VALUES('#{title}', '#{description}', '#{price}', '#{available_from}', '#{available_to}');")
  end

  def self.find(id:)
    if ENV["ENVIRONMENT"] == "test"
      db = PG.connect(dbname: "makersbnb_test")
    else
      db = PG.connect(dbname: "makersbnb")
    end

    result = db.exec("SELECT * FROM spaces WHERE id=#{id};")
  end
end
