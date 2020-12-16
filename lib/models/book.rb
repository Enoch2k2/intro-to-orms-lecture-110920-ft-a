class Book < ActiveRecord::Base
    validates :title, uniqueness: true, presence: true

    belongs_to :genre
    belongs_to :author
end


# Book.new(author: "Bob", id: 1, title: "This amazing title", genre: "Some Genre")