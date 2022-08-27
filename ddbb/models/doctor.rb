require "sqlite3"

db = SQLite3::Database.new("ddbb/hospital.db")
db.results_as_hash = true

# results = db.execute("SELECT * FROM doctors").first
# results = db.execute("INSERT INTO doctors (name, specialty) VALUES ('Sigmund','Analist')")

# results = db.execute("INSERT INTO doctors (name, specialty) VALUES (?,?)", 'Gonchi','Psychologist')
# above syntax is best to avoid SQL injection, a hacking practice.


# p results["name"]

# puts "ID: #{results["id"]} Tu doc se llama: #{results["name"]}"

results = db.execute("SELECT * FROM doctors")
results.each do |result|
  puts "#{result["id"]} #{result["name"]}"
end
