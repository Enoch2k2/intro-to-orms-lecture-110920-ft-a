class Book < ActiveRecord::Base
    validates :title, uniqueness: true, presence: true
    validates :genre, presence: true
    validates :author, presence: true
end


# Book.new(author: "Bob", id: 1, title: "This amazing title", genre: "Some Genre")