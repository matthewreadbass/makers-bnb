require "pg"

class Times
  def self.all
    if ENV["ENVIRONMENT"] == "test"
      db = PG.connect(dbname: "makersbnb_test")
    else
      db = PG.connect(dbname: "makersbnb")
    end
    results = db.exec("SELECT * FROM times;")
    results.map { |time| { space_id: time["space_id"], available_from: time["available_from"], available_to: time["available_to"] } }
  end

  def self.create(space_id, available_from, available_to, available = "y")
    if ENV["ENVIRONMENT"] == "test"
      db = PG.connect(dbname: "makersbnb_test")
    else
      db = PG.connect(dbname: "makersbnb")
    end
    db.exec("INSERT INTO times (space_id, available_from, available_to) VALUES('#{space_id}', '#{available_from}', '#{available_to}');")
  end

  def self.available?(space_id, request_date)
    if ENV["ENVIRONMENT"] == "test"
      db = PG.connect(dbname: "makersbnb_test")
    else
      db = PG.connect(dbname: "makersbnb")
    end
    results = db.exec("SELECT * FROM times WHERE space_id = '#{space_id}' AND '#{request_date}' BETWEEN available_from AND available_to;")
    results.to_a.length >= 1 ? true : false
  end
end
