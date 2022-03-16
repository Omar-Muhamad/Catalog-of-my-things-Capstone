require_relative '../classes/book'

module BookData
  def read_books
    file = './files/books-data.json'
    data = []
    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |element|
        data.push(Book.new(element['title'], element['publisher'], element['cover_state'], element['publish_date'], element['archived'], id: element['id']))
      end
    end
    data
  end

  def save_books(books)
    data = []
    books.each do |book|
      data.push({ id: book.id, title: book.title, publisher: book.publisher, cover_state: book.cover_state, publish_date: book.publish_date, archived: book.archived})
    end
    File.write('./files/books-data.json', JSON.generate(data))
  end
end