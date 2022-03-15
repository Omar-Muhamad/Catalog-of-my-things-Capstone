class Genre
  attr_reader :id, :name, :items
  
  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end
end