class Item
  attr_accessor :genre, :author, :label
  attr_reader :id, :publish_date, :archived

  def initialize(publish_date, archived, id: nil)
    @id = id || Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def add_genre(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def add_author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def add_label(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def can_be_archived?
    current_year = Time.now.year
    current_year - publish_date > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
