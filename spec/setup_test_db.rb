require "pg"

def setup_test_db
  db = PG.connect(dbname: "makersbnb_test")

  db.exec("TRUNCATE users;")
  db.exec("TRUNCATE spaces;")
end
