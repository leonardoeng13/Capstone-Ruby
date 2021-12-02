require_relative '../library/book/book'
require_relative '../library/game/game'
require_relative '../library/movie/movie'
require_relative '../library/music/music_album'

module CreateHandlers
  def create_book
    print 'Publisher: '
    publisher = gets.chomp

    print 'Is cover state good? [y/n]: '
    cover_state = gets.chomp.downcase == 'y' ? 'good' : 'bad'

    Book.new(publisher, cover_state, publish_date)
  end

  def create_music_album
    print 'Is album on Spotify? [y/n]: '
    on_spotify = gets.chomp.downcase == 'y'

    MusicAlbum.new(on_spotify, publish_date)
  end

  def create_movie
    print 'Is movie silent? [y/n]: '
    is_silent = gets.chomp.downcase == 'y'

    Movie.new(is_silent, publish_date)
  end

  def create_game
    print 'Is game multiplayer? [y/n]: '
    is_multiplayer = gets.chomp.downcase == 'y'

    print 'Last played at? (YYYY/MM/DD): '
    last_played_at = Time.parse gets.chomp

    Game.new(is_multiplayer, last_played_at, publish_date)
  end

  def publish_date
    print 'Publish date? (YYYY/MM/DD): '
    Time.parse gets.chomp
  end
end
