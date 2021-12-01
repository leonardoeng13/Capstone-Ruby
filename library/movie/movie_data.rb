require 'json'
require_relative 'movie'

# module MovieStorage
module MovieStorage
  def save_movie
    @json_movie = []
    @movies.each do |movie|
      @json_movie.push('Source' => movie.name, 'silent' => movie.silent,
                       'publish_date' => movie.publish_date)
    end
    File.write('movie.json', JSON.pretty_generate(@json_movie))
  end

  def parse_movie
    unless File.exist?('movie.json')
      File.open('movie.json', 'w') do |f|
        f.write JSON.pretty_generate([])
      end
    end
    JSON.parse(File.read('movie.json')).map do |movie|
      @movies << Movie.new(movie['Studio'], movie['cover_state'], movie['publish_date'])
    end
  end
end
