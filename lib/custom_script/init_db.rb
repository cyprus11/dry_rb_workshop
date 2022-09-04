require 'sqlite3'

db = SQLite3::Database.new("db/test.db")

db.execute(
  %{
    CREATE TABLE IF NOT EXISTS cat_toy_testings(
      id       INTEGER PRIMARY KEY,
      account_id INT,
      cat_toy_id INT,
      tested BOOLEAN NOT NULL CHECK (tested IN (0, 1))
    )
  }
)

db.execute(
  %{
    CREATE TABLE IF NOT EXISTS characteristics(
      id INTEGER PRIMARY KEY,
      cat_toy_testing_id INT,
      characteristic_type TEXT,
      value TEXT,
      comment TEXT,
      will_recomended BOOLEAN NOT NULL CHECK (will_recomended IN (0, 1)),

      FOREIGN KEY(cat_toy_testing_id) REFERENCES cat_toy_testings(id)
    )
  }
)

db.execute(
  %{
    CREATE TABLE IF NOT EXISTS testers_accountings(
      id       INTEGER PRIMARY KEY,
      account_id INT,
      counter    INT,
    )
  }
)
