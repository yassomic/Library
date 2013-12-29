# Initializing a new book instance.
# @title - Title of book to be added.
# @author - Author of book to be added.
# @status - Set status to "available" when new book instance created.
# @borrower - Borrower to be set when book checked in or out.
class Book
  attr_reader :title, :author
  attr_accessor :status, :borrower
  def initialize(title, author)
    @title = title
    @author = author
    @status = "Available"
    @borrower = nil
  end
end

# Initialize Borrower instance.
# @name - Name of borrower.
# @borrowed_books - Create empty array of borrower's borrowed books.
class Borrower
  attr_accessor :name, :borrowed_books
  def initialize(name)
    @name = name
    @borrowed_books = []
  end

  def borrowed_books_count
    @borrowed_books.length
  end

  def borrowed_books_list
    @borrowed_books.each do |borrowed|
      puts borrowed.title
    end
  end
end

# Public: Initialize new empty library.
# Public: Display title and status of each book.
class Library
  attr_accessor :books
  def initialize
    @books = []
  end

  #Push new books into the @books array
  def add_book(book)
    @books << book
  end

  #Loop through to display book title and status
  def list_books
    @books.each do |book|
      puts "#{book.title}: #{book.status}"
    end
  end

  #Loop through to display book title of available books
  def available_books
    @books.each do |book|
      if book.status == "Available"
        puts "#{book.title}"
      end
    end
  end

  #Loop through to display book title and borrower name of borrowed books
  def borrowed_books
    @books.each do |book|
      if book.status == "Unavailable"
        puts "#{book.title}: #{book.borrower.name}"
      end
    end
  end

  def check_out(user, book)
    if book.status == "Available" && user.borrowed_books_count < 2
      book.borrower = user
      puts  "#{user.name} checked out #{book.title}"
      user.borrowed_books << book
      book.status = "Unavailable"
    elsif
      user.borrowed_books_count >= 2
      puts "Sorry, #{user.name} already has 2 or more books checked out."
    else
      puts "Sorry, #{book.title} is not available."
    end
  end

  #Remove check-out status
  def check_in(book)
    book.status = "Available"
    book.borrower = nil
    self.borrowed_books[book].remove
  end
end