Container.register_provider(:db) do |container|
  prepare do
    require 'sqlite3'
  end

  start do
    db = SQLite3::Database.open 'db/test.db'
    db.results_as_hash = true

    register('persistance.db', db)
  end

  stop do
    container['persistance.db'].close
  end
end
