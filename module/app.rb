require_relative 'add_handlers'
require_relative 'list_handlers'
require_relative 'create_handlers'
require_relative 'persist'

class App
  include AddHandlers
  include ListHandlers
  include CreateHandlers

  def initialize
    persistor = Persist.new
    data = persistor.load

    @items = data['items']
    @genres = data['genres']
    @authors = data['authors']
    @sources = data['sources']
    @labels = data['labels']
  end

  def run
    puts 'Welcome to the Catalog of your Things 🗂️'

    loop do
      puts
      print_options

      option = gets.chomp

      if option == '7'
        persistor = Persist.new
        persistor.save(@items, @genres, @authors, @sources, @labels)
        break
      end

      handle_option option
    end

    puts 'Thank you for using this app 🙏🏻'
  end

  def handle_option(option)
    case option
    when '1'
      list_items
    when '2'
      list_genres
    when '3'
      list_labels
    when '4'
      list_authors
    when '5'
      list_sources
    when '6'
      add_item
    else
      puts 'That is not a valid option ❌'
    end
  end

  def print_options
    puts 'Please choose your option by entering a number 😊:'
    puts '1 - List items'
    puts '2 - List all genres'
    puts '3 - List all labels'
    puts '4 - List all authors'
    puts '5 - List all sources'
    puts '6 - Add item'
    puts '7 - Quit'
  end

  def add_item
    puts 'Please choose your option by entering a number 😊:'
    puts '1 - Add a book 📗'
    puts '2 - Add a music album 🎶'
    puts '3 - Add a movie 🎥'
    puts '4 - Add a game 🎮'
    option = gets.chomp

    handle_add_item option
  end

  def handle_add_item(option)
    item = nil

    case option
    when '1'
      item = create_book
    when '2'
      item = create_music_album
    when '3'
      item = create_movie
    when '4'
      item = create_game
    else
      puts 'That is not a valid option ❌'
      return nil
    end

    add_associations item

    @items.push item
    puts 'Item added successfully ✔'
  end
end
