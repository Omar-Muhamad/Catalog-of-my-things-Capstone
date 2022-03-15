require_relative './item'

class MusicAlbum < Item
  def initialize(publish_date, archived, on_spotify)
    super(publish_date, archived)
    @on_spotify = on_spotify
  end
end