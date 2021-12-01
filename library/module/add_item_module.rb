require_relative '../music/music_album'
require_relative '../book/book'
require_relative '../game/game'
require_relative '../movie/movie'
require 'date'

#  rubocop:disable all

# Create Module
module ItemIntializer
  def initialize
    @item_option = '0'
  end

  def items_option
    puts "\n Which item do you want to add to your catalog :"
    puts '1) Create a book 📗'
    puts '2) Create a Music Album 🎶'
    puts '3) Create a Game 🎮'
    puts '4) Create a Movie 🎥'
    puts "\n"
  end

  def add_selected_item(id)
    case @item_option
    when '1'
      create_book(id)
    when '2'
      create_music_album(id)
    when '3'
      create_game(id)
    when '4'
      create_movie(id)
    else
      "\nCould you please choose a valid number\n"
    end
  end

  def create_item(id)
    until %w[1 2 3 4].include?(@item_option)
      items_option
      @item_option = gets.chomp
      add_selected_item(id)
    end
    @item_option = '0'
  end

  # Handlers for input

  # Date validation 
  def validate?(date)
    Date.iso8601(date.to_s)
    true
  rescue ArgumentError
    false
  end

  def validate_date(date)
    if validate?(date)
      date
    else
      print 'Add a valid date format [yyyy-mm-dd] : '
      answer = gets.chomp
      validate_date(answer)
    end
  end

  # Book input handler
  def cover_state?(answer)
    case answer
    when 'bad'
      'bad'
    when 'good'
      'good'
    else
      print 'Could you please specify your answer by [good/bad]: '
      new_answer = gets.chomp
      cover_state?(new_answer)
    end
  end 

  # MusicAlbum input handler
  def on_spotify?(answer)
    case answer
    when 'y'
      true
    when 'n'
      false
    else
      print 'Could you please specify your answer by [y/n]: '
      second_answer = gets.chomp
      on_spotify?(second_answer)
    end
  end

  # Game input handler

  def multiplayer?(answer)
    case answer
    when 'n'
      false
    when 'y'
      true
    else
      print 'Could you please specify your answer by [Y/N]: '
      new_answer = gets.chomp
      multiplayer?(new_answer)
    end
  end

  # Movie input handler
  def movie_name
    print "Add your movie\'s source : "
    gets.chomp.to_s
  end
  def is_silent?(answer)
    true unless answer == 'n'
    false
  end

  # Request info to create item
  def author_info
    print "\n Author first name: "
    author_first = gets.chomp
    print "\n Author second name: "
    author_second = gets.chomp
    [author_first, author_second]
  end

  def genre_info
    print "\n Gender: "
    genre = gets.chomp
    genre
  end

  def source_info
    print "\n Source: "
    source = gets.chomp
    source
  end

  def label_info
    print "\n Label title: "
    title = gets.chomp
    print "\n Label color: "
    color = gets.chomp
    [title, color]
  end

  def game_info
    print 'Last played at (yyyy-mm-dd): '
    date_answer = gets.chomp
    last_played_at = validate_date(date_answer)

    print 'Is it Multiplayer? [Y/N]: '
    answer = gets.chomp.downcase
    multiplayer = multiplayer?(answer)

    print 'Publish date (yyyy-mm-dd): '
    publisher_answer = gets.chomp    

    [last_played_at, publisher_answer, multiplayer]
  end

  def book_info
    print 'Published date (yyyy-mm-dd): '
    date_answer = gets.chomp
    publish_date = date_answer

    print 'Is it good or bad? [good/bad]: '
    answer = gets.chomp.downcase
    cover_state = cover_state?(answer)

    print 'Publisher\'s name: '
    publisher = gets.chomp.downcase

    [publish_date, publisher, cover_state]
  end

  def music_album_info
    print "Add your music album\'s name : "
    name = gets.chomp.to_s

    print 'Published date (yyyy-mm-dd): '
    date_answer = gets.chomp
    publish_date = validate_date(date_answer)

    print 'Is it on spotify? [Y/N]: '

    answer = gets.chomp.downcase
    on_spotify = on_spotify?(answer)

    [name, publish_date, on_spotify]
  end

  def movie_info
    name = movie_name
    print 'Published date (yyyy-mm-dd): '
    date_answer = gets.chomp
    publish_date = validate_date(date_answer)

    print 'Is it silent? [Y/N]: '

    answer = gets.chomp.downcase
    silent = is_silent?(answer)

    [publish_date, silent, name]
  end
  
  #Create items methods

  def create_book(id)
    publish_date, publisher, cover_state = book_info
    author_first, author_second = author_info
    label_title, label_color = label_info
    genre = Genre.new(id, genre_info)
    author = Author.new(id, author_first, author_second)
    source = Source.new(id, source_info)
    label = Label.new(id, label_title, label_color)

    new_book = Book.new(id, genre, author, source, label, publisher, cover_state, publish_date)
    puts new_book.can_be_archived?
    @books << new_book if new_book.can_be_archived?
    puts 'Book created successfully ✔️'
  end

  def create_music_album
    name, publish_date, on_spotify = music_album_info
    music_album = MusicAlbum.new(name, publish_date, on_spotify)
    genre = music_album_genre
    genre.add_item(music_album)
    @music_albums << music_album
    puts 'Music album created successfully ✔️'
  end

  def create_movie
    publish_date, silent, name = movie_info
    movie = Movie.new(silent, publish_date, name)
    @movies << movie
    puts 'Movie created successfully ✔️'
  end

  def create_game
    publish_date, multiplayer, last_played_at = game_info
    game = Game.new( publish_date, multiplayer, last_played_at)
    author = game_author
    author.add_item(game)
    @games.push(game)
    puts 'Game created successfully ✔️'
  end

  
end