require_relative './item'

class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color, id = Random.rand(1..1000))
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    items << item
    item.label = self
  end
end

p label = Label.new("Lord Of the Rings", "gray")
p label.title
p label.color
p label.items
label.add_item(Item.new(2000, true))
p label.items.length
