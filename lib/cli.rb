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

        Book.create(title: title, genre: genre, author: author)
    end

    def list_books
        puts "----------------"
        Book.all.each do |book|
            puts "Title: #{book.title}"
            puts "Author: #{book.author}"
            puts "Genre: #{book.genre}"
            puts "----------------"
        end
    end

    def get_input(input_message)
        print input_message
        gets.chomp
    end
end