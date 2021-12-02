require_relative '../library/book/book'
require_relative '../library/game/game'
require_relative '../library/movie/movie'
require_relative '../library/music/music_album'
require_relative 'label'
require_relative 'author'
require_relative 'genre'
require_relative 'source'
require 'time'

module AddHandlers
  def add_associations(item)
    add_genre item
    add_author item
    add_source item
    add_label item
  end

  def add_genre(item)
    puts 'Select a genre in the following list or "n" to add new genre: '
    @genres.each_with_index { |genre, idx| puts "#{idx} - #{genre}" }
    option = gets.chomp.downcase
    genre = nil

    if option == 'n'
      print 'Genre name: '
      genre = Genre.new(gets.chomp)
      @genres.push genre
    else
      genre = @genres[option.to_i]
    end
    item.add_genre genre
  end

  def add_author(item)
    puts 'Select an author from the following list or "n" to add a new author: '
    @authors.each_with_index { |author, idx| puts "#{idx} - #{author}" }
    option = gets.chomp.downcase
    author = nil

    if option == 'n'
      print 'Author first name: '
      first_name = gets.chomp

      print 'Author last name: '
      last_name = gets.chomp

      author = Author.new(first_name, last_name)
      @authors.push author
    else
      author = @authors[option.to_i]
    end
    item.add_author author
  end

  def add_source(item)
    puts 'Select a source from the following list or "n" to add a new source: '
    @sources.each_with_index { |source, idx| puts "#{idx} - #{source}" }
    option = gets.chomp.downcase
    source = nil

    if option == 'n'
      print 'Source: '
      source = Source.new(gets.chomp)
      @sources.push source
    else
      source = @sources[option.to_i]
    end
    item.add_source source
  end

  def add_label(item)
    puts 'Select a label from the following list or "n" to add a new label: '
    @labels.each_with_index { |label, idx| puts "#{idx} - #{label} #{label.color}" }
    option = gets.chomp.downcase
    label = nil

    if option == 'n'
      print 'Label title: '
      title = gets.chomp

      print 'Label color: '
      color = gets.chomp

      label = Label.new(title, color)
      @labels.push(label)
    else
      label = @labels[option.to_i]
    end
    item.add_label label
  end
end
