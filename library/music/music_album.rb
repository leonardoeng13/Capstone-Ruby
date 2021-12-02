# rubocop:disable Metrics/ParameterLists
require_relative '../../item'

# class MusicAlbum
class MusicAlbum < Item
  attr_accessor :on_spotify, :publish_date, :name

  def initialize(id, genre, author, source, label, on_spotify, publish_date)
    super(id, genre, author, source, label, publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    puts @on_spotify
    @on_spotify && super
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'on_spotify' => @on_spotify,
      'publish_date' => @publish_date
    }.to_json(*args)
  end
end
# rubocop:enable Metrics/ParameterLists
