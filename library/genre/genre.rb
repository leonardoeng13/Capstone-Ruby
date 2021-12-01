# Genre Class
require_relative '../music/music_album'

class Genre
  attr_reader :name, :items

  def initialize(id, name)
    @name = name
    @id = id
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.genre = self
  end
end
