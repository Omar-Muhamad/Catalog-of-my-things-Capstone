require_relative './classes/item'
require_relative './classes/author'
require_relative './classes/game'

author = Author.new('Mary', 'Poppins')

game = Game.new(true, 2021, 2002, false)

item = Item.new(2002, false)

author.add_item(item)

p item.can_be_archived?

p game.can_be_archived?
