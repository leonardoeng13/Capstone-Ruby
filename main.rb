#-------------------------------------------------------------------------------------#
#                           Capstone Ruby Project                                     #
# Project Participants: Leo de Andrade                                                #
#                       Herbert Orellana                                              #
#                       Laylo Khodjaeva                                               #
#                       Juan Luis G                                                   #   
#                                                                                     #
# In this project, you will create a console app that will help you to keep a record  #
# of different types of things you won: books, music albums, movies, and games.       #
# Everything will be based on the UML class diagram presented below. The data will be #
# stored in JSON files but you will also prepare a database with tables structure     #
# analogical to your program's class structure.                                       #
#                                                                                     #
#-------------------------------------------------------------------------------------#


#  rubocop:disable all
require_relative 'genre'
require '.lib/label/label'
require '.lib/label/author'
require '.lib/module/add_item_module'
require '.lib/module/list_items_module'
require '.lib/music/music_album_data'
require '.lib/music/book_album_data'
require '.lib/game/game_data'
require '.lib/movie/movie'
require 'json'

class App
  include ItemIntializer
  include ListItems
  include MusicAlbumStorage
  include BookStorage
  include GameStorage
  include MovieStorage

  def initialize
    @books = []
    @music_albums = []
    @games = []
    @movies = []
    @genres = [Genre.new('Jazz'), Genre.new('Classical Music'), Genre.new('Blues'), Genre.new('Rock'), Genre.new('RnB'), Genre.new('Pop')]
    @labels = [Label.new('Love at the end of the day.', 'Blue'),Label.new('May I love you?', 'Red'),Label.new('The love of my lives.', 'Grey')]
    @titles = [Title.new('Spider-Man: Homecoming ', 'Jon Watts'),Title.new('Spider-Man: Far From Home', 'Jon Watts'),Title.new('Spider-Man: No Way Home', 'Jon Watts')]
    @authors = [Author.new('Stephen King', 'Horror'), Author.new('J.K. Rowling', 'Fantasy'), Author.new('Amy Tan', 'Fiction'), Author.new('Tana French', 'Crime fiction')]
    @choice_list = {
      '1' => 'Create an Item',
      '2' => 'List all items.',
      '3' => 'List all genres.',
      '4' => 'List all labels.',
      '5' => 'List all authors.',
      '6' => 'Exit'
    }  
  end

  def run
    parse_music_albums
    parse_book
    parse_game
    parse_movie
    puts "Welcome to the Catalog of your Things 🗂️ \n"

    loop do
      puts "\nPlease choose your option by entering a number 😊 :"
      puts "\n"
      @choice_list.each do |key, value|
        puts "#{key} - #{value}"
      end
      print "\nYour option ==> "
      option = gets.chomp
      if option == '6'
        exit
        break
      end

      handle_option(option)
    end
  end

  def handle_option(option)
    case option
    when '1'
      create_item
    when '2'
      list_items
    when '3'
      list_genres
    when '4'
      list_label
    else
      puts 'That is not a valid option ❌'
    end
  end

  def exit
    save_music_albums
    save_book
    save_game
    save_movie
    puts "\n Your data is preserved in our DB"
    puts " Thank you for using this app 🙏🏻"
  end
end


app = App.new
app.run