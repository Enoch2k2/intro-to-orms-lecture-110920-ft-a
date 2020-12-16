# ENV["SINATRA_ENV"] ||= "development"

require 'sqlite3'
require 'pry'

require 'rake'
require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "./db/books.db"
)

# DB = SQLite3::Database.new("db/books.db")

# sql = <<-SQL
#   CREATE TABLE IF NOT EXISTS books (
#     id INTEGER PRIMARY KEY,
#     title TEXT,
#     genre TEXT,
#     author TEXT
#   )
# SQL

# DB.execute(sql)
# DB.results_as_hash = true

# [1, "LOTR", "Fantasy", "Author"]
=begin
  {
    id: 1,
    title: "LOTR",
    genre: "Fantasy",
    author: "JRR Tolkein"
  }
=end

require_relative "./models/book"
require_relative "./models/author"
require_relative "./models/genre"
require_relative "./cli"