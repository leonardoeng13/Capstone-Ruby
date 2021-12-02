require_relative '../library/book/book'
require_relative '../library/game/game'
require_relative '../library/movie/movie'
require_relative '../library/music/music_album'

module ListHandlers
  def list_items
    puts 'Please select an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all movies'
    puts '4 - List all games'
    option = gets.chomp

    case option
    when '1'
      list_books
    when '2'
      list_music_albums
    when '3'
      list_movies
    when '4'
      list_games
    else
      puts 'That is not a valid input'
    end
  end

  def list_genres
    @genres.each { |genre| puts genre }
  end

  def list_authors
    @authors.each { |author| puts author }
  end

  def list_sources
    @sources.each { |source| puts source }
  end

  def list_labels
    @labels.each { |label| puts label }
  end

  def list_books
    @items.each { |item| puts item if item.instance_of? Book }
  end

  def list_music_albums
    @items.each { |item| puts item if item.instance_of? MusicAlbum }
  end

  def list_movies
    @items.each { |item| puts item if item.instance_of? Movie }
  end

  def list_games
    @items.each { |item| puts item if item.instance_of? Game }
  end
end
