require_relative './item'

class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(publish_date, archived, on_spotify)
    super(publish_date, archived)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super.can_be_archived? && on_spotify == true
  end

  def self.path
    'files/music_album.json'
  end

  def self.write_file(data = [])
    data_arr = []
    data.each do |d|
      data_arr << { 
        id: d.id, 
        publish_date: d.publish_date, 
        archived: d.archived,
        on_spotify: d.on_spotify,
        genre_id: d.genre.id
      }
    end
    File.write(MusicAlbum.path, JSON.generate(data_arr))
  end
end
