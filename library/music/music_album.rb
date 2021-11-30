require_relative '../../item'

# class MusicAlbum
class MusicAlbum < Item
  attr_accessor :on_spotify, :publish_date

  def initialize(on_spotify, publish_date)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived
    return true if @on_spotify && super
  end
end
