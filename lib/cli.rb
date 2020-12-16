class Cli
    def start
        puts "Welcome to the Library Cli with an ORM!"
        main_menu
    end

    def main_menu
        main_menu_options
        main_menu_input
    end

    def main_menu_options
        puts "Type '1' to create a book"
        puts "Type '2' to create a genre"
        puts "Type '3' to create an author"
        puts "Type '4' to list books"
        puts "Type '5' to search books"
        puts "Type '6' to list authors"
        puts "Type '7' to list genres"
        puts "Type 'exit' to exit program"
    end

    def main_menu_input
        input = gets.chomp

        if input == "1"
            create_book
            main_menu
        elsif input == "2"
            create_genre
            main_menu
        elsif input == "3"
            create_author
            main_menu
        elsif input == "4"
            list_books
            main_menu
        elsif input == "5"
            search_books
            main_menu
        elsif input == "6"
            list_authors
            main_menu
        elsif input.downcase == "exit"
            puts "Goodbye!"
            exit
        else
            puts "Invalid input, please try again!"
            main_menu
        end
    end

    def create_genre
        name = get_input("Please enter the name of the genre you want to create: ")

        genre = Genre.new(name: name)
        if !genre.save
            display_errors(genre)
        end
    end

    def create_author
        name = get_input("Please enter the name of the author you want to create: ")

        author = Author.new(name: name)
        if !author.save
            display_errors(author)
        end
    end
        
    def create_book
        book_title = get_input("Please enter the title of the book: ")
        genre_name = get_input("Please enter the genre of the book: ")
        author_name = get_input("Please enter the author of the book: ")

        genre = Genre.find_or_create_by(name: genre_name)
        author = Author.find_or_create_by(name: author_name)

        book = Book.new(title: book_title, genre: genre, author: author)
        if !book.save
            display_errors(book)
        end
    end
    
    def display_errors(obj)
        puts "These errors prohibited the #{obj.class.name} from being saved."
        obj.errors.full_messages.each.with_index(1) do |error, index|
            puts "#{index}. #{error}"
        end
    end

    def list_books
        puts "----------------"
        Book.all.each do |book|
            book_details(book)
            puts "----------------"
        end
    end

    def list_authors
        puts "----------------"
        Author.all.each do |author|
            author_details(author)
            puts "----------------"
        end
    end

    def author_details(author)
        puts "Name: #{author.name}"
        puts "Genres: "
        puts "---------"
        author.genres.each do |genre|
            puts genre.name
            puts "---------"
        end
        puts "Books: "
        puts "---------"
        author.books.each do |book|
            puts book.title
            puts "---------"
        end
    end

    def book_details(book)
        puts "Title: #{book.title}"
        puts "Author: #{book.author.name}"
        puts "Genre: #{book.genre.name}"
        puts "Number of Pages: #{book.number_of_pages}"
    end

    def list_searched_books(books)
        books.each do |book|
            book_details(book)
        end
    end

    def search_books
        puts "Which book would you like to search for?"
        input = get_input("Search by Title: ")
        books = Book.where("title LIKE ?", "%#{input}%")
        list_searched_books(books)
    end

    def get_input(input_message)
        print input_message
        gets.chomp
    end
end