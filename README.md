Difference between testing and development environments:

# Testing Environment

- Rspec Database
- clear out data after every test

# Development Environment

- Dummy Information (Seed File)

# Associating Our Objects

- book that belongs to a genre
- author that has many books
- genre that has many books

- author is going to have many genres through books
- genre is going to have many authors through books

# Authors

- name

- has many books

# Books

- Title
- number of pages : integer
- author_id : integer
- genre_id : integer

- the belongs to always gets the foreign key

# Genres

- name

- has many books

### Associated Builds

We have our classes that allows us to create new instances:

- new means unsaved
- create means saved

Associated Builds work a lot of the same way.

```
# has many relationship

author = Author.first
author.books.build(title: "some book title", genre_id: 2) # unsaved
author.books.create(title: "some book title", genre_id: 2) # saved

# author.books would give us a collection of books with the book we just built

# belongs to relationship

book = Book.first
book.build_author(name: "Bob") # unsaved
book.create_author(name: "Bob") # saved

book.author # gives us the author with the name of Bob
```
