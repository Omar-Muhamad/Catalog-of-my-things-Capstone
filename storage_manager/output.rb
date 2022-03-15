require 'json'

class Output
  def initialize(path)
    @path = path
  end

  def create_files
    Dir.mkdir(@path) unless Dir.exist?(@path)
    FileUtils.touch("#{@path}/games.json") unless File.exist?("#{@path}/games.json")
  end

  def save_games(state)
    games_hash = state[:games].map do |game|
      { multiplayer: game.multiplayer, last_played_at: game.last_played_at, publish_date: game.publish_date,
        archived: game.archived }
    end
    games_json = JSON.generate(games_hash)
    File.write("#{@path}/games.json", games_json)
  end
end
