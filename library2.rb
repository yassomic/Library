class Library
  attr_reader :books, :available_books
  attr_accessor :borrowed_books
  def initialize
    @books = []
    puts "Mike's Library"
  end

  def books
  end

  def list_books
    @books.each do |books|
      puts "#{books.title}: #{books.status}"
    end
  end

  def borrowed_books
    @books.each do |book|
      if book.status == "Unavailable"
        puts "#{book.title} is #{book.status}"
      end
    end
  end

  def available_books
    @books.each do |book|
      if book.status == "Available"
        puts "#{book.title} is #{book.status}"
      end
    end
  end

  def add_book(book)
    @books << book
    puts book.title
  end

  def check_out(user, book)
    puts "#{user.name} checked out #{book.title}"
    if book.status == "Available" && user.borrowed_books_count < 2
      book.borrower = user
      user.borrowed_books << book
      book.status = "Unavailable"
    else
      puts "Sorry, #{book.title} is not available."
    end
  end

  def check_in(book)
    book.status = "Available"
    book.borrower = nil
    self.borrowed_books[book].remove
  end
end

class Borrower
  attr_reader :borrowed_books_list, :borrowed_books_count
  attr_accessor :borrowed_books
  def initialize(name)
    @name = name
    @borrowed_books = []
    puts @name
  end

  def borrowed_books
    @borrowed_books
  end

  def name
    @name
  end

  def borrowed_books_count
    @borrowed_books.length
  end

  def borrowed_books_list
    @borrowed_books.each do |book|
      puts book.title
    end
  end
end

class Book
  attr_accessor :title, :author, :status, :borrower

  def initialize(title, author)
    @title = title
    @author = author
    @status = "Available"
    @borrower = nil
    puts @title + ", by " + @author
  end
end
