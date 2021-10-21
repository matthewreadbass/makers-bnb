require "pg"

class Space
  def self.all
    if ENV["ENVIRONMENT"] == "test"
      db = PG.connect(dbname: "makersbnb_test")
    else
      db = PG.connect(dbname: "makersbnb")
    end

    results = db.exec("SELECT * FROM spaces;")
    results.map do |space|
      { title: space["title"], description: space["description"], price: space["price"], user_id: space["user_id"] }
    end
  end

  def self.add(title, description, price, user_id)
    if ENV["ENVIRONMENT"] == "test"
      db = PG.connect(dbname: "makersbnb_test")
    else
      db = PG.connect(dbname: "makersbnb")
    end
    db.exec("INSERT INTO spaces (title, description, price, user_id) VALUES('#{title}', '#{description}', '#{price}', '#{user_id}');")
  end
end
