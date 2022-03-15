require_relative 'item'

class Game < Item

  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, *args, **kwargs)
    super(*args, **kwargs)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    @current_year = Time.now.year
    super && @current_year - @last_played_at > 2
  end
end
