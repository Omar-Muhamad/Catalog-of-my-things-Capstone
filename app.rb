require_relative './classes/genre'

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

    @genre_names = ['Pop', 'Metal', 'Jazz', 'Country', 'Classical']
    @genres = []
    @genre_names.each_with_index do |option, index|
      @genres << Genre.new(index, option)
    end
  end

  def run
    @options.each_with_index do |option, index|
      puts "[#{index + 1}]- #{option}"
    end
    user_input
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
    when 10 then exit
    else p 'Please choose a number between 1-10'
    end
  end

  def exit
    p 'Thank you for using this app. Have a great day!'
  end
end
