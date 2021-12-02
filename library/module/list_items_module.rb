#  rubocop:disable all
require_relative '../music/music_album'
require_relative '../book/book'
require_relative '../game/game'
require_relative '../movie/movie'

module ListItems
  def initialize
    @list_item_option = '0'
  end

  def list_items_option
    puts "\n Which item do you wish to list :"
    puts '1) List all books '
    puts '2) List all music albums'
    puts '3) List all games'
    puts '4) List all movies'
    puts "\n"
  end

  def list_selected_item
    case @list_item_option
    when '1'
      list_books
    when '2'
      list_music_albums
    when '3'
      list_games
    when '4'
      list_movies
    else
      "\nCould you please choose a valid number\n"
    end
  end

  def list_items
    until %w[1 2 3 4].include?(@list_item_option)
      list_items_option
      print 'Enter your option number here --> '
      @list_item_option = gets.chomp
      list_selected_item
    end
    @list_item_option = '0'
  end

  def list_music_albums
    puts "\nList of your Music Albums : "
    puts "\n ~ Your music albums list is empty ~" if @music_albums.empty?
    @music_albums.each { |music_album| puts music_album.label.title }
  end

  def list_books
    puts "\nList of your Books : "
    puts "\n Your books list is empty." if @books.empty?
    @books.each { |book| puts book}
  end

  def list_games
    puts "\nList of your Games : "
    puts "\n Your games list is empty." if @games.empty?
    @games.each { |game| puts game}
  end

  def list_movies
    puts "\nList of your Movies : "
    puts "\n Your movies list is empty." if @movies.empty?
    @movies.each { |movie| puts movie.label.title}
  end

  def list_label
    puts "\nList of labels: "
    @labels.each_with_index { |label, index| puts"#{index}) Title: #{label.title} Color: #{label.color}"}
  end

  def list_source
    puts "\nList of sources: "
    @sources.each_with_index { |source, index| puts"#{index}) Title: #{source.name}"}
  end

  def list_genres
    puts "\nList of genres : "
    @genres.each_with_index { |genre, index| puts "#{index}) Genre ~ #{genre.name}"}
  end

  def list_author
    puts "\nList of authors : "
    @authors.each_with_index { |author, index| puts "#{index}) Author ~ #{author.first_name} #{author.last_name}"}
  end
end
