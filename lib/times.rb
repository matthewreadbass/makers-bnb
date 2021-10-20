require "pg"

class Times
  def self.create(available_from, available_to)
    if ENV["ENVIRONMENT"] == "test"
      db = PG.connect(dbname: "makersbnb_test")
    else
      db = PG.connect(dbname: "makersbnb")
    end
    db.exec("INSERT INTO times (available_from, available_to) VALUES('#{available_from}', '#{available_to}');")
  end
  def self.all
    if ENV["ENVIRONMENT"] == "test"
      db = PG.connect(dbname: "makersbnb_test")
    else
      db = PG.connect(dbname: "makersbnb")
    end

    results = db.exec("SELECT * FROM times;")
    results.map { |time| { available_from: time["available_from"], available_to: time["available_to"] } }
  end
end
