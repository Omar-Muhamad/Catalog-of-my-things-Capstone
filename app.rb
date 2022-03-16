require 'json'
require_relative './classes/genre'
require_relative './modules/music_album_module'
require_relative './modules/genre_module'
require_relative './modules/games_module'
require_relative './modules/author_module'
require_relative './modules/book_module'
require_relative './modules/label_module'
require_relative './storage_manager/output'
require_relative './storage_manager/input'

class App
  include BookModule
  include MusicAlbumModule
  include GenreModule
  include GamesModule
  include AuthorModule
  include LabelModule

  def initialize
    @options = [
      'List all books', 'List all music albums', 'List all games', 'List all genres', 'List all labels',
      'List all authors', 'Add a book', 'Add a music album', 'Add a game', 'Exit the app'
    ]
    @genres = []
    @books = []
    @labels = []
    @state = { games: [], authors: [] }
    @output = Output.new('./files')
    @input = Input.new('./files')
    add_authors(@state)
    add_genres(@genres)
    add_labels(@labels)
    @music_albums = MusicAlbum.read_file(@genres)
  end

  def run
    @input.read_games(@state)
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
    when 1 then list_all_books(@books)
    when 2 then list_all_music_albums(@music_albums)
    when 3 then list_all_games(@state)
    when 4 then list_all_genres(@genres)
    when 5 then list_all_labels(@labels)
    when 6 then list_all_authors(@state)
    else operator_two(user_choice)
    end
  end

  def operator_two(user_choice)
    case user_choice
    when 7 then @books << add_book
    when 8 then @music_albums << add_music_album(@genres)
    when 9 then add_game(@state)
    when 10 then exit_program
    else puts 'Please choose a number between 1-10'
    end
  end

  def exit_program
    puts 'Thank you for using this app. Have a great day!'
    MusicAlbum.write_file(@music_albums)
    @output.save_games(@state)
    exit
  end
end
