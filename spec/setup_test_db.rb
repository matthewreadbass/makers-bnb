require "pg"

def setup_test_db
  # p "Setting up test db..."

  db = PG.connect(dbname: "makersbnb_test")

  db.exec("TRUNCATE TABLE users RESTART IDENTITY;")
  db.exec("TRUNCATE TABLE spaces RESTART IDENTITY;")
end
