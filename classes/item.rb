class Item
  attr_accessor :genre, :author, :label

  def initialize(publish_date, archived)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def add_genre(genre)
    @genre = genre
  end
  def add_author(author)
    @author = author
  end
  def add_label(label)
    @label = label
  end

  def can_be_archived?

  end

  def move_to_archive

  end
end