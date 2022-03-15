require 'json'
require_relative '../classes/game'

class Input
  def initialize(path)
    @path = path
  end

  def read_games(state)
    games_json = File.read("#{@path}/games.json")
    games_hash = JSON.parse(games_json)
    games = games_hash.map do |game|
      Game.new(game['multiplayer'], game['last_played_at'], game['publish_date'], game['archived'])
    end
    state[:games].concat(games)
  end
end
