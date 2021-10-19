require "pg"

class User
  def self.all
    if ENV["ENVIRONMENT"] == "test"
      db = PG.connect(dbname: "makersbnb_test")
    else
      db = PG.connect(dbname: "makersbnb")
    end

    results = db.exec("SELECT * FROM users;")
    results.map { |user| { name: user["first_name"], email: user["email"], password: user["password"] } }
  end

  def self.create(first_name, email, password)
    if ENV["ENVIRONMENT"] == "test"
      db = PG.connect(dbname: "makersbnb_test")
    else
      db = PG.connect(dbname: "makersbnb")
    end

    db.exec("INSERT INTO users (first_name, email, password) VALUES('#{first_name}', '#{email}', '#{password}');")
  end
end
