require_relative "../classes/book"

module BookModule
  def list_all_books(books)
    if books.length.zero?
      puts 'No books found!'
    else
      books.each do |book|
        puts "[#{book.id}]- Title: #{book.title}, Publisher: #{book.publisher}, and Cover State: #{book.cover_state}"
      end
    end
  end
  
  def add_book
    print 'Title: '
    title = gets.chomp
    print 'Publisher: '
    publisher = gets.chomp
    print 'Cover State: (good or bad) '
    cover_state = gets.chomp
    print 'Publish date [YYYY-MM-DD]:'
    publish_date = gets.chomp
    print 'Archived(y or n): '
    choice = gets.chomp.downcase
    archived = choice == 'y'
    book = Book.new(title, publisher, cover_state, publish_date, archived)
  end
end