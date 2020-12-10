class Book
    attr_accessor :id, :title, :genre, :author

    # new - new instance, not saved
    def initialize(id: nil, title:, genre:, author:)
        self.id = id
        self.title = title
        self.genre = genre
        self.author = author
    end

    def save
        sql = <<-SQL
            INSERT INTO books (title, genre, author) VALUES (?, ?, ?);
        SQL

        DB.execute(sql, self.title, self.genre, self.author)

        self.id = DB.execute("SELECT id FROM books ORDER BY id DESC;")[0]["id"]
    end

    # create - newly saved instance
    def self.create(id: nil, title:, genre:, author:)
        book = self.new(id: id, title: title, genre: genre, author: author)
        book.save
        book
    end

    def self.all
        sql = <<-SQL
            SELECT * FROM books;
        SQL

        data = DB.execute(sql)

        data.collect do |hash|
            Book.new(id: hash["id"], title: hash["title"], genre: hash["genre"], author: hash["author"])
        end

    end
end


# Book.new(author: "Bob", id: 1, title: "This amazing title", genre: "Some Genre")