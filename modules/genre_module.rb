require_relative '../classes/genre'

module GenreModule
  def list_all_genres(genres)
    puts 'Genres:'
    genres.each do |genre|
      puts "#{genre.id} - #{genre.name}"
    end
  end

  def add_genres(genres)
    genre_names = %w[Pop Metal Jazz Country Classical]
    genre_names.each_with_index do |option, index|
      genres << Genre.new(index, option)
    end
  end
end
