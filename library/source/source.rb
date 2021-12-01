# frozen_string_literal: true

# class Source
class Source
  attr_accessor :id, :name, :items

  def initialize(id, name)
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    item.add_source = self
    @items << item unless @items.include?(item)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'name' => @name,
      'items' => @items
    }.to_json(*args)
  end
end
