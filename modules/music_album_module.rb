require_relative "../classes/music_album"
require_relative './genre_module'

module MusicAlbumModule
  include GenreModule

  def list_all_music_albums(music_albums)
    puts 'Music Albums:'
    music_albums.each do |album|
      puts "#{album.id} - Genre:#{album.genre.name}, Date:#{album.publish_date}, Spotify: #{album.on_spotify}"
    end
    puts 'No Albums found' if music_albums.length.zero?
  end

  def add_music_album(genres)
    print 'Publish Date [YYYY-MM-DD]: '
    publish_date = gets.chomp
    print 'On Spotify [Y/N]: '
    on_spotify = gets.chomp
    on_spotify = on_spotify.downcase != 'n'
    puts 'Select a genre from the following list by number'
    list_all_genres(genres)
    genre = gets.chomp
    if genre.to_i < genres.length
      music_album = MusicAlbum.new(publish_date, false, on_spotify)
      music_album.add_genre(genres[genre.to_i])
      puts 'Music album created successfully'
      music_album
    else
      puts 'Please enter a valid genre num'
    end
  end
end