require_relative '../classes/book'

describe 'Create book object' do
  context 'given the valid inputs' do
    before :each do
      @book = Book.new('harry potter', 'omar', 'good', '2000-01-01', true)
      @book2 = Book.new('harry potter', 'omar', 'good', '2020-01-01', true)
      @book3 = Book.new('harry potter', 'omar', 'bad', '2000-01-01', true)
    end
    it 'should create a book with a title Harry Potter' do
      expect(@book.title).to eql('harry potter')
    end
    it 'should create a book with a publisher omar' do
      expect(@book.publisher).to eql('omar')
    end
    it 'should create a book with cover_state = good' do
      expect(@book.cover_state).to eql('good')
    end
    it 'can_be_archived? should return true if the book archivable and Cover_state is good' do
      expect(@book.can_be_archived?).to be(true)
    end
    it 'can_be_archived? should return false if the book not archivable and Cover_state is good' do
      expect(@book2.can_be_archived?).to be(false)
    end
    it 'can_be_archived? should return false if the book archivable and Cover_state is bad' do
      expect(@book3.can_be_archived?).to be(false)
    end
  end
end
