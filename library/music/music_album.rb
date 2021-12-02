require_relative '../../module/item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify, *args)
    super(*args)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  def to_s
    "[Music Album] On Spotify: #{@on_spotify}, #{super}"
  end

  def to_json(*args)
    super.merge({
                  JSON.create_id => self.class.name,
                  'on_spotify' => @on_spotify
                }).to_json(*args)
  end

  def self.json_create(object)
    music_album = new(object['on_spotify'], Time.parse(object['publish_date']))
    music_album.id = object['id']
    music_album
  end
end