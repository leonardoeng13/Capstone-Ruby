require 'json'
require_relative 'movie'

# module MovieStorage
module MovieStorage
  def save_movie
    @json_movie = []
    @movies.each do |book_album|
      @json_movie.push('Studio' => book_album.publisher, 'cover_state' => book_album.cover_state,
                      'publish_date' => book_album.publish_date)
    end
    File.write('book_album.json', JSON.pretty_generate(@json_book))
  end

  def parse_book
    unless File.exist?('book_album.json')
      File.open('book_album.json', 'w') do |f|
        f.write JSON.pretty_generate([])
      end
    end
    JSON.parse(File.read('book_album.json')).map do |book_album|
      @books << movie.new(book_album['Studio'], book_album['cover_state'], book_album['publish_date'])
    end
  end
end