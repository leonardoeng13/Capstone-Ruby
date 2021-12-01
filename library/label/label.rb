require_relative '../../item'

# Create label class
class Label
  attr_accessor :color, :title
  attr_reader :items

  def initialize(id, title, color)
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.label = self
  end
end
