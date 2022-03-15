require 'json'
require_relative './classes/genre'
require_relative './classes/music_album'
require_relative './classes/game'
require_relative './classes/author'

class App
  def initialize
    @options = [
      'List all books',
      'List all music albums',
      'List all games',
      'List all genres',
      'List all labels',
      'List all authors',
      'Add a book',
      'Add a music album',
      'Add a game',
      'Exit the app'
    ]

    @genre_names = %w[Pop Metal Jazz Country Classical]
    @genres = []
    @genre_names.each_with_index do |option, index|
      @genres << Genre.new(index, option)
    end

    @music_albums = MusicAlbum.read_file(@genres)
    @games = []
    @authors = []
    @author_names = ['Stephen King', 'Hermann Hesse', 'J.K Rowling', 'Friedrich Nietzsche']
    @author_names.each do |author|
      first_name = author.split(' ')[0]
      last_name = author.split(' ')[1]
      @authors << Author.new(first_name, last_name)
    end
  end

  def run
    loop do
      @options.each_with_index do |option, index|
        puts "[#{index + 1}]- #{option}"
      end
      user_input
    end
  end

  def user_input
    print 'Please choose an option [1-10] '
    user_choice = gets.chomp.to_i
    operator(user_choice)
  end

  def operator(user_choice)
    case user_choice
    when 1 then list_all_books
    when 2 then list_all_music_albums
    when 3 then list_all_games
    when 4 then list_all_genres
    when 5 then list_all_lables
    when 6 then list_all_authors
    else operator_two(user_choice)
    end
  end

  def operator_two(user_choice)
    case user_choice
    when 7 then add_book
    when 8 then add_music_album
    when 9 then add_game
    when 10 then exit_program
    else puts 'Please choose a number between 1-10'
    end
  end

  def exit_program
    puts 'Thank you for using this app. Have a great day!'
    MusicAlbum.write_file(@music_albums)
    exit
  end

  def list_all_music_albums
    puts 'Music Albums:'
    @music_albums.each do |album|
      puts "#{album.id} - Genre:#{album.genre.name}, Date:#{album.publish_date}, Spotify: #{album.on_spotify}"
    end
    puts 'No Albums found' if @music_albums.length.zero?
  end

  def list_all_genres
    puts 'Genres:'
    @genres.each do |genre|
      puts "#{genre.id} - #{genre.name}"
    end
  end

  def add_music_album
    print 'Publish Date: '
    publish_date = gets.chomp
    print 'On Spotify [Y/N]: '
    on_spotify = gets.chomp
    on_spotify = on_spotify.downcase != 'n'
    puts 'Select a genre from the following list by number'
    list_all_genres
    genre = gets.chomp
    if genre.to_i < @genres.length
      music_album = MusicAlbum.new(publish_date, false, on_spotify)
      music_album.add_genre(@genres[genre.to_i])
      @music_albums << music_album
      puts 'Music album created successfully'
    else
      puts 'Please enter a valid genre num'
    end
  end

  def list_all_authors
    p "There are no authors here" if @authors.length == 0
    @authors.each_with_index do |author, index| p "[#{index}] - #{author.first_name} #{author.last_name}"
    end
    puts
  end

  def add_game
    print 'Is this game for multiple players? [Y/N]: '
    multiplayer = gets.chomp.downcase
    multiplayer = multiplayer == "y"
    print 'Please enter the year this game was last played in [YYYY]: '
    last_played_at = gets.chomp.to_i
    print 'In which year was this game published? [YYYY]: '
    publish_date = gets.chomp.to_i
    print 'Has this game been archived? [Y/N]: '
    archived = gets.chomp.downcase
    archived = archived == "y"
    puts 'Choose an author from the following list using the number'
    list_all_authors
    author_chosen = gets.chomp.to_i
    game = Game.new(multiplayer, last_played_at, publish_date, archived)
    p @authors[author_chosen]
    game.add_author(@authors[author_chosen])
    @games << game
    p 'The game has been added successfully!'
    puts
  end

  def list_all_games
    p 'There are no games here!' if @games.length == 0
    @games.each_with_index do |game, index| p "[#{index+1}] - Multiplayer: #{game.multiplayer}, Last Played: #{game.last_played_at}, Archived: #{game.archived}"
    end
    puts
  end
end
