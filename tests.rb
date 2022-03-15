require_relative './classes/item'
require_relative './classes/author'
require_relative './classes/game'

author = Author.new("Mary", "Poppins")

game = Game.new(true, 2012)

item = Item.new(2002, false)

author.add_item(item)

p item.author
