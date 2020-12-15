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
        puts "Type '2' to list books"
        puts "Type '3' to search books"
        puts "Type 'exit' to exit program"
    end

    def main_menu_input
        input = gets.chomp

        if input == "1"
            create_book
            main_menu
        elsif input == "2"
            list_books
            main_menu
        elsif input == "3"
            search_books
            main_menu
        elsif input.downcase == "exit"
            puts "Goodbye!"
            exit
        else
            puts "Invalid input, please try again!"
            main_menu
        end
    end

    def create_book
        title = get_input("Please enter the title of the book: ")
        genre = get_input("Please enter the genre of the book: ")
        author = get_input("Please enter the author of the book: ")

        book = Book.new(title: title, genre: genre, author: author)
        if !book.save
            puts "These errors prohibited the book from being saved."
            book.errors.full_messages.each.with_index(1) do |error, index|
                puts "#{index}. #{error}"
            end
        end
    end

    def list_books
        puts "----------------"
        Book.all.each do |book|
            book_details(book)
            puts "----------------"
        end
    end

    def book_details(book)
        puts "Title: #{book.title}"
        puts "Author: #{book.author}"
        puts "Genre: #{book.genre}"
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